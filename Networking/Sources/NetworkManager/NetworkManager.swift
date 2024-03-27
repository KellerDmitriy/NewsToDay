//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation
import CoreImage

public final class NetworkManager {
    public static let shared = NetworkManager()
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    private let apiKey = "pub_40669167f5b9c344181f2c7e28f917505ffd7"
    private let apiKey1 = "pub_40710f81e68e7061f7ed766760a42acbb6b47"
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func getLatestNews(lang: String, categories: String) async -> Result<NewsModel, NetworkError> {
        await request(from: .latestNews(lang: lang, categories: categories))
//            .asyncFlatMap(loadRawImage(toCache: cache))
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
            
//            images
//                .map { ($0, urlStrings) }
//                .map(zip)?
//                .forEach(cache.save)
            
            return .success(model)
        }
    }
    
    func request<T: Decodable>(from endpoint: Endpoint) async -> Result<T, Error> {
        await Result
            .success(endpoint)
            .map(\.urlRequest)
//            .map(addApiKey(apiKey))
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
        guard let httpResponse = dataResponse.1 as? HTTPURLResponse else {
            return .failure(NetworkError.invalidResponse)
        }
        
        switch httpResponse.statusCode {
        case 200:
            return .success(dataResponse.0)
        case 400:
            return .failure(
                NetworkError.serverError(statusCode: 400,
                description: "Parameter missing")
            )
        case 401:
            return .failure(
                NetworkError.serverError(statusCode: 401,
                description: "Unauthorized")
            )
        case 403:
            return .failure(
                NetworkError.serverError(statusCode: 403,
                description: "CORS policy failed. IP/Domain restricted")
            )
        case 409:
            return .failure(
                NetworkError.serverError(statusCode: 409,
                description: "Parameter duplicate")
            )
        case 415:
            return .failure(
                NetworkError.serverError(statusCode: 415,
                description: "Unsupported type")
            )
        case 422:
            return .failure(
                NetworkError.serverError(statusCode: 422,
                description: "Unprocessable entity")
            )
        case 429:
            return .failure(
                NetworkError.serverError(statusCode: 429,
                description: "Too many requests")
            )
        case 500:
            return .failure(
                NetworkError.serverError(statusCode: 500,
                description: "Internal server error")
            )
        default:
            return .failure(NetworkError.invalidResponse)
        }
    }
}
