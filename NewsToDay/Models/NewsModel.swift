//
//  NewsModel.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Foundation

struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsResults]?
}

struct NewsResults: Codable, Hashable {
    var id: String?
    var title: String?
    var url: String?
    var author: String?
    var description: String?
    var content: String?
    var urlToImage: String?
}
