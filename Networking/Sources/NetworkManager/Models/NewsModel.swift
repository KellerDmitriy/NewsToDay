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

public struct NewsResults: Codable, Hashable, Identifiable {
    public var id: String? {
        return UUID().uuidString
    }
    public let title: String?
    public let url: String?
    public let author: String?
    public let description: String?
    public let content: String?
    public let urlToImage: String?
        
    public static let preview = NewsResults(title: "Call-out for people with psoriasis to take part in new study - EchoLive.ie", url: "https://news.google.com/rss/articles/CBMiNGh0dHBzOi8vd3d3LmVjaG9saXZlLmllL2Nvcmt2aWV3cy9hcmlkLTQxMzU4NTY4Lmh0bWzSAQA?oc=5", author: "EchoLive.ie", description: "", content: "", urlToImage: "")
}
