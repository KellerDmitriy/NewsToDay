//
//  LanguageScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct LanguageScreen: View {
//    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var languageManager = LanguageManager()
    
    var body: some View {
        VStack {
            CustomButton(title: "English", imageName: "checkmark", action: {
                languageManager.changeLanguage(to: .english)
            }, buttonType: .language, isSelected: languageManager.currentLanguage == .english)
            .padding([.horizontal, .top])
            
            CustomButton(title: "Russian", imageName: "checkmark", action: {
                languageManager.changeLanguage(to: .russian)
            }, buttonType: .language, isSelected: languageManager.currentLanguage == .russian)
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
