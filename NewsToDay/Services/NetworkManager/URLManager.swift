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
    
    private let apiKey = "2b9cf27ea13e45eb89926c533fb14c6b"
    
    private let baseURL = "https://newsapi.org"
    private let apiEndpoint = "/v2/top-headlines"
    
    func createURL(queryItems: [URLQueryItem] = []) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = apiEndpoint
        urlComponents.queryItems = queryItems
        
        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: apiKey)
        urlComponents.queryItems?.append(apiKeyQueryItem)
        
        return urlComponents.url
    }
}


