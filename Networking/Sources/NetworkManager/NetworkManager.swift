//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation
import CoreImage

public enum NetworkError: Error {
    case invalidResponse
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case invalidURL
    case unknown(Error)
}

extension NetworkError {
    init(_ error: Error) {
        if let error = error as? NetworkError {
            self = error
            return
        }
        
        switch error {
        case is URLError:
            self = .invalidURL
            
        case is DecodingError:
            self = .decodingError(error)
            
        default:
            self = .unknown(error)
        }
    }
}

public final class NetworkManager {
    public static let shared = NetworkManager()
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let cache: ImageStore = .init()
 
    private let apiKey1 = "pub_40669167f5b9c344181f2c7e28f917505ffd7"
    private let apiKey = "pub_40710f81e68e7061f7ed766760a42acbb6b47"
    
    private init() {
//        self.cache = cache
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func getLatestNews(lang: String, categories: String) async -> Result<NewsModel, NetworkError> {
        await request(from: .latestNews(lang: lang, categories: categories))
            .asyncFlatMap(loadRawImage(toCache: cache))
            .mapError(NetworkError.init)
    }
    
    public func getNewsWith(searchText: String) async -> Result<NewsModel, NetworkError> {
        await request(from: .newsWith(searchText: searchText))
            .mapError(NetworkError.init)
    }
    
    public func getLatestNews() async -> Result<NewsModel, NetworkError> {
        await request(from: .latestAllNews())
            .mapError(NetworkError.init)
    }
    
}

private extension NetworkManager {
    func loadRawImage(toCache cache: ImageStore) -> (NewsModel) async -> Result<NewsModel, Error> {
        { model in
            let urlStrings = model.results
                .compactMap(\.imageUrl)
            
            let images = try? await urlStrings
                    .compactMap(URL.init)
                    .concurrentMap(self.session.data(from:))
                    .map(\.0)
                    .compactMap(CIImage.init)
                    .compactMap(\.cgImage)
                    
            images
                .map { ($0, urlStrings) }
                .map(zip)?
                .forEach(cache.save)
            
            return .success(model)
        }
    }
    
    func request<T: Decodable>(from endpoint: Endpoint) async -> Result<T, Error> {
        await Result
            .success(endpoint)
            .map(\.urlRequest)
            .map(addApiKey(apiKey))
            .asyncMap(session.data)
            .flatMap(unwrapResponse)
            .decode(T.self, decoder: decoder)
    }
    
    func addApiKey(_ key: String) -> (URLRequest) -> URLRequest {
        {
            var request = $0
            request.addValue(key, forHTTPHeaderField: "X-Api-Key")
            return request
        }
    }
    
    func unwrapResponse(_ dataResponse: (Data, URLResponse)) -> Result<Data, Error> {
        guard
            let httpResponse = dataResponse.1 as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            return .failure(NetworkError.invalidResponse)
        }
        return .success(dataResponse.0)
    }
}

