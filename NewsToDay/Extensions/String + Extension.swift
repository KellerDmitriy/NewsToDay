//
//  String + Extension.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 21.03.2024.
//

import Foundation

extension String {
    func localized(_ language: SelectedLanguage) -> String {
        guard let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            print("Failed to find path for language: \(language.rawValue)")
            return self
        }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
