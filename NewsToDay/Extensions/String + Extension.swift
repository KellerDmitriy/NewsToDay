//
//  String + Extension.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 21.03.2024.
//

import Foundation

extension String {
    var localized: String {
        let lang = LocalizationManager.shared.language.rawValue
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
