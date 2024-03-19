//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData() async throws -> NewsModel {
        let countryQueryItem = URLQueryItem(name: "country", value: "us")
        guard let url = URLManager.shared.createURL(queryItems: [countryQueryItem]) else {
            fatalError("Failed to create URL")
        }
        print(url)
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let result = try decoder.decode(NewsModel.self, from: data)
            print(result)
            return result
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
