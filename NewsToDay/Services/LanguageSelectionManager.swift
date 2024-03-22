//
//  LanguageSelectionManager.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import Foundation
import SwiftUI

// MARK: - Selected Language
public enum SelectedLanguage: String {
    case russian = "ru"
    case english = "en"
}

final class LocalizationManager: ObservableObject {
    // MARK: - Varibles
    public static let shared = LocalizationManager()
    @AppStorage("selectedLanguage") private var languageString: String = SelectedLanguage.russian.rawValue
    @Published public var language: SelectedLanguage = .russian {
        didSet {
            languageString = language.rawValue
            UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
    
    // MARK: - Init
    public init() {
        if let selectedLanguage = SelectedLanguage(rawValue: languageString) {
            language = selectedLanguage
        }
    }
}

//extension String {
//    var localized: String {
//        let lang = UDService.getLanguage() создать метод который будет менять язык. удалить лангвичМенеджер и переименовать LanguageSelectionManager на LanguageManager

//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
//}
