//
//  APIManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 19.03.2024.
//

import Foundation
//для категорий https://newsapi.org/v2/top-headlines?category=business&apiKey=2b9cf27ea13e45eb89926c533fb14c6b
//для поиска https://newsapi.org/v2/everything?q=Apple&apiKey=2b9cf27ea13e45eb89926c533fb14c6b
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
    case newsWith(searchText: String)
    
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
        case .newsWith(searchText: _):
            return "/v2/everything"
        }
           
    }

    var parameters: [String : String]? {
        switch self {
        case .newsFor(category: let category):
            let params = ["category": category]
            return params
        case .newsWith(searchText: let searchText):
            let params = ["q" : searchText]
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
        return urlComponents.url
    }
}
