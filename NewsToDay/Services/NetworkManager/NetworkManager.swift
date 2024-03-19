//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

extension NetworkError {
    init(_ error: Error) {
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

final class NetworkManager {
    static let shared = NetworkManager()
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    private let apiKey = "2b9cf27ea13e45eb89926c533fb14c6b"
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchData(with category: String) async throws -> NewsModel {
        let endpoint = NewsEndpoint.newsFor(category: category)
        
        guard let url = APIManager.shared.createURL(for: endpoint) else {
                   throw NetworkError.invalidURL
               }
        print(url)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let result = try decoder.decode(NewsModel.self, from: data)
            print(result)
            return result
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
    
    func fetch(_ endpoint: NewsEndpoint) async -> Result<NewsModel, NetworkError> {
        guard let url = APIManager.shared.createURL(for: endpoint) else {
            return .failure(.invalidURL)
        }
        return await request(for: url)
    }
}

private extension NetworkManager {
    func request<T: Decodable>(for url: URL) async -> Result<T, NetworkError> {
        await Result
            .success(url)
            .map { URLRequest(url: $0) }
            .map(addApiKey(apiKey))
            .asyncMap(session.data)
            .map(\.0)
            .decode(T.self, decoder: decoder)
            .mapError(NetworkError.init)
    }
    
    func addApiKey(_ key: String) -> (URLRequest) -> URLRequest {
        {
            var request = $0
            request.addValue(key, forHTTPHeaderField: "X-Api-Key")
            return request
        }
    }
}

public extension Result where Failure == Error {
    
    /// Creates a new result by evaluating a asynchronous throwing closure, capturing the returned value as a success, or any thrown error as a failure.
    /// - Parameter body: A asynchronous throwing closure to evaluate.
    @inlinable
    init(asyncCatch body: () async throws -> Success) async {
        do {
            let success = try await body()
            self = .success(success)
        } catch {
            self = .failure(error)
        }
    }
        
    @inlinable
    func asyncMap<T>(
        _ transform: (Success) async throws -> T
    ) async -> Result<T, Failure> {
        switch self {
        case .success(let success):
            return await Result<T, Failure> { try await transform(success) }
            
        case .failure(let failure):
            return .failure(failure)
        }
    }
}

extension Result where Success == Data{
    @inlinable
    func decode<T: Decodable>(_ type: T.Type, decoder: JSONDecoder) -> Result<T, Error> {
        switch self {
        case .success(let success):
            return Result<T, Error> { try decoder.decode(type.self, from: success) }
            
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
