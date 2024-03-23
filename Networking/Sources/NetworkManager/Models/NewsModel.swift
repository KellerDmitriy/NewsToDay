//
//  NewsModel.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

public struct NewsModel: Codable {
    public let status: String?
    public let totalResults: Int?
    public let articles: [NewsResults]?
}

public struct NewsResults: Codable, Hashable {
    public let id: String?
    public let title: String?
    public let url: String?
    public let author: String?
    public let description: String?
    public let content: String?
    public let urlToImage: String?
}
