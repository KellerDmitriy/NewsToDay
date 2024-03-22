//
//  LanguageManager.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import Foundation

class LanguageManager: ObservableObject {
    @Published var currentLanguage: SelectedLanguage = .english
    
    func changeLanguage(to language: SelectedLanguage) {
        currentLanguage = language
    }
}
