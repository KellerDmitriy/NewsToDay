//
//  APIManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 19.03.2024.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension APIEndpoint {
    var parameters: [String: Any]? {
        return nil
    }
}

enum NetworkError: Error {
    case invalidResponse
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case invalidURL
    case unknown(Error)
}

enum NewsEndpoint: APIEndpoint {
    case newsFor(category: Categories.RawValue)
    
    var baseURL: URL {
        guard let url = URL(string:"https://newsapi.org") else {
            fatalError("Invalid baseURL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .newsFor(category: _):
            return "/v2/top-headlines"
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case .newsFor(category: let category):
            let params = ["category": category]
            return params
        }
    }
}

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func createURL(for endpoint: APIEndpoint) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.baseURL.scheme
        urlComponents.host = endpoint.baseURL.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = []
        
        if let parameters = endpoint.parameters {
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: value)
                urlComponents.queryItems?.append(queryItem)
            }
        }
        
//        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: apiKey)
//        urlComponents.queryItems?.append(apiKeyQueryItem)
        
        return urlComponents.url
    }
}
