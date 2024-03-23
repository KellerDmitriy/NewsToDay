//
//  Constants.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 19.03.2024.
//

import Foundation


enum Categories: String, CaseIterable, Hashable, Identifiable {
    var id: String { rawValue }
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    case politics
    case life
    case gaming
    case animals
    case nature
    case food
    case art
    case history
    case fashion
    case covid19
    case middleeast
    
    var image: String {
        switch self {
        case .sports: "🏈"
        case .politics: "⚖️"
        case .life: "🌞"
        case .gaming: "🎮"
        case .animals: "🐻"
        case .nature: "🌴"
        case .food: "🍔"
        case .art: "🎨"
        case .history: "📜"
        case .fashion: "👗"
        case .covid19: "😷"
        case .middleeast: "⚔️"
        case .business: "💲"
        case .entertainment: "🗾"
        case .general: "🪖"
        case .health: "🚑"
        case .science: "🧬"
        case .technology: "👩🏾‍💻"
        }
    }
    
    var localizedString: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}


