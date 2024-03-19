//
//  Constants.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 19.03.2024.
//

import Foundation
 
enum Categories: String, CaseIterable, Hashable, Identifiable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology 
    
    var id: String { rawValue }
}

