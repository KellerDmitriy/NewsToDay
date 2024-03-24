//
//  LocalizationManager.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import Foundation
import SwiftUI

// MARK: - Selected Language
enum Language: String {
    case ru
    case en
}

final class LocalizationManager {
    // MARK: - Properties
    public static let shared = LocalizationManager()
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "selectedLanguage") else {
                saveLanguage(.en)
                return .en
            }
            
            return Language(rawValue: languageString) ?? .en
        } set {
            if newValue != language {
                saveLanguage(newValue)
            }
        }
    }
    
    // MARK: - Init
    public init() { }
    
    // MARK: - Methods
    private func saveLanguage(_ language: Language) {
        UserDefaults.standard.setValue(language.rawValue, forKey: "selectedLanguage")
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
    }
}
