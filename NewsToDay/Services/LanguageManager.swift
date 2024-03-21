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
    // MARK: - Varibles
    public static let shared = LocalizationManager()
    
    var Language: SelectedLanguage {
        get {
            guard  let LanguageString =  UserDefaults .standard.string(forKey: "selectedLanguage" ) else {
                saveLanguage(.english)
                return .english
            }
            
            return  SelectedLanguage(rawValue: LanguageString) ?? .english
        } set {
            if newValue != Language {
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
