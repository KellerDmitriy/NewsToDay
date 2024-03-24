//
//  Endpoints.swift
//  
//
//  Created by Илья Шаповалов on 21.03.2024.
//

import Foundation

//для категорий https://newsapi.org/v2/top-headlines?category=business &apiKey=2b9cf27ea13e45eb89926c533fb14c6b
//для поиска https://newsapi.org/v2/everything?q=Apple &apiKey=2b9cf27ea13e45eb89926c533fb14c6b
// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

extension Endpoint {
    static func get() -> Endpoint { Endpoint(method: .GET) }
    
    static func categoriesWith(lang: String) -> Self {
        Endpoint.get()
            .path("top-headlines/sources")
            .queryItems {
                URLQueryItem(name: "language", value: lang)
            }
    }
    
    static func everything(about: String) -> Self {
        Endpoint.get()
            .path("everything")
            .queryItems {
                URLQueryItem(name: "q", value: about)
            }
    }
    
    static func headlines(category: String) -> Self {
        Endpoint.get()
            .path("top-headlines")
            .queryItems {
                URLQueryItem(name: "category", value: category)
            }
    }
    
    static func headlines(lang: String, category: String) -> Self {
        Endpoint
            .headlines(category: category)
            .queryItems {
                URLQueryItem(name: "language", value: lang)
            }
    }
}
