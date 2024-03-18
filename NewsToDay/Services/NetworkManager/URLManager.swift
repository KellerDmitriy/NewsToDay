//
//  URLManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

final class URLManager {
    static let shared = URLManager()
    private init() {}
    
    #warning("APIKEY")
    private let apiKey = ["2b9cf27ea13e45eb89926c533fb14c6b"]
        
    private let baseURL = "https://newsapi.org"
    private let apiEndpoint = "/api"
    
    func createURL(with path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var urlComponents = URLComponents()
        urlComponents?.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents?.path = apiEndpoint + path
        urlComponents?.queryItems = queryItems
        
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        return urlComponents?.url
    }
}


