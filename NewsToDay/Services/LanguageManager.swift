//
//  LanguageManager.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import Foundation
import SwiftUI

// MARK: - Selected Language
enum SelectedLanguage: String {
    case russian = "ru"
    case english = "en"
}

final class LocalizationManager: ObservableObject {
    // MARK: -Properties
    static let shared = LocalizationManager()
    
    var language: SelectedLanguage {
        get {
            guard  let languageString =  UserDefaults .standard.string(forKey: "selectedLanguage" ) else {
                saveLanguage(.english)
                return .english
            }
            
            return  SelectedLanguage(rawValue: languageString) ?? .english
        } set {
            if newValue != language {
                saveLanguage(newValue)
            }
        }
    }
    
    // MARK: - Init
    private init () { }
    
    // MARK: - Методы
    private  func  saveLanguage ( _ language: SelectedLanguage ) {
        UserDefaults .standard.setValue(language.rawValue, forKey: "selectedLanguage" )
        UserDefaults .standard.set([language.rawValue], forKey: "AppleLanguages" )
    }
}
