//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

final class NetworkManager {
    
    let decoder = JSONDecoder()
    static let shared = NetworkManager()
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
}
