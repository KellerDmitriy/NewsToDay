//
//  LanguageScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct LanguageScreen: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.Language
    
    //    @StateObject private var languageManager = LocalizationManager.shared
    
    var body: some View {
        VStack {
            CustomButton(
                title: "English",
                imageName: "checkmark",
                action: {
                language = .english
            }, buttonType: .language, 
                isSelected: language == .english)
            .padding([.horizontal, .top])
            
            CustomButton(
                title: "Russian",
                imageName: "checkmark",
                action: {
                language = .russian
            }, buttonType: .language, 
                         isSelected:
                            language == .russian)
            .padding([.horizontal, .top])
            
            Spacer()
        }
        .navigationTitle("Language")
    }
}

#Preview {
    NavigationView {
        LanguageScreen()
        //           .environmentObject(LanguageManager())
    }
}
