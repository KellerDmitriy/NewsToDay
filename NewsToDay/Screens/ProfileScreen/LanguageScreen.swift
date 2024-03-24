//
//  LanguageScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct LanguageScreen: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    var body: some View {
        VStack {
            CustomButton(
                title: "English".localized(language),
                imageName: "checkmark",
                action: {
                language = .en
            }, buttonType: .language, 
                isSelected: language == .en)
            .padding([.horizontal, .top])
            
            CustomButton(
                title: "Russian".localized(language),
                imageName: "checkmark",
                action: {
                language = .ru
            }, buttonType: .language, 
                         isSelected:
                            language == .ru)
            .padding([.horizontal, .top])
            
            Spacer()
        }
        .navigationTitle("Language".localized(language))
    }
}

#Preview {
    NavigationView {
        LanguageScreen()
    }
}
