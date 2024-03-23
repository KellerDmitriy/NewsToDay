//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

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
    private let apiKey2 = "2b9cf27ea13e45eb89926c533fb14c6b"
    private let apiKey = "63d415cde5ad4051ae34e09b85a9f4c7"
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func getNewsWith(searchText: String) async -> Result<NewsModel, NetworkError> {
        await request(from: .everything(about: searchText))
    }
    
    public func getNewsFor(category: String) async -> Result<NewsModel, NetworkError> {
        await request(from: .headlines(category: category))
    }
}

private extension NetworkManager {
    func request<T: Decodable>(from endpoint: Endpoint) async -> Result<T, NetworkError> {
        await Result
            .success(endpoint)
            .map(\.urlRequest)
            .map(addApiKey(apiKey))
            .asyncMap(session.data)
            .map(\.0)
            .decode(T.self, decoder: decoder)
            .mapError(NetworkError.init)
    }
    
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
