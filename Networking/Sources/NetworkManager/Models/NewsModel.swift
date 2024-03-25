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
    public let results: [NewsResults]
}

public struct NewsResults: Codable, Hashable, Identifiable {
    public var id: String? {
        return UUID().uuidString
    }
    public let title: String?
    public let link: String
    public let creator: [String]?
    public let description: String
    public let content: String
    public let imageUrl: String?
    public let category: [String]?
    public let country: [String]
        
    public static let preview = NewsResults(
        title: "Call-out for people with psoriasis to take part in new study - EchoLive.ie",
        link:"https://news.google.com/rss/articles/CBMiNGh0dHBzOi8vd3d3LmVjaG9saXZlLmllL2Nvcmt2aWV3cy9hcmlkLTQxMzU4NTY4Lmh0bWzSAQA?oc=5",
        creator: ["EchoLive.ie"],
        description: "",
        content: "",
        imageUrl: "",
        category: ["food"], 
        country: ["af"])
}
