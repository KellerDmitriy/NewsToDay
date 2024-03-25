//
//  Endpoints.swift
//
//
//  Created by Илья Шаповалов on 21.03.2024.
//

import Foundation

//https://newsdata.io/api/1/news?language=en&category=domestic &apikey=pub_40669167f5b9c344181f2c7e28f917505ffd7

extension Endpoint {
    static func get() -> Endpoint { Endpoint(method: .GET) }
    
    static func latestNews(lang: String, categories: String) -> Self {
        Endpoint.get()
            .path("news")
            .queryItems {
                URLQueryItem(name: "language", value: lang)
                URLQueryItem(name: "category", value: categories)
            }
    }
    
    static func latestAllNews() -> Self {
        Endpoint.get()
            .path("news")
    }
    
    static func newsWith(searchText: String) -> Self {
        Endpoint.get()
            .path("news")
            .queryItems {
                URLQueryItem(name: "q", value: searchText)
            }
    }
}
