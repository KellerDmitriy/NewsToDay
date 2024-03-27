//
//  File.swift
//  
//
//  Created by Келлер Дмитрий on 26.03.2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidResponse
    case transportError(Error)
    case serverError(statusCode: Int, description: String)
    case noData
    case decodingError(Error)
    case invalidURL
    case unknown(Error)
}

extension NetworkError {
    public init(_ error: Error) {
        if let networkError = error as? NetworkError {
            self = networkError
            return
        }
        
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


