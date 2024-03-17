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
    
    private let baseURL = "https://newsapi.org"
    private let apiEndpoint = "/api"
    
    func createURL(with path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = apiEndpoint + path
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
}


