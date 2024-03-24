//
//  SearchBar.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import DS

struct SearchBar: View {
    
    @Binding var text: String
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    private struct Drawing {
        static let iconPadding: CGFloat = 12
        static let iconName: String = "magnifyingglass"
        static let textFieldHeight: CGFloat = 55
        static let backgroundColorOpacity: Double = 0.2
        static let cornerRadius: CGFloat = 12
        static let horizontalPadding: CGFloat = 16
    }

    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: Drawing.iconName)
                .foregroundColor(DS.Colors.Theme.secondaryText)
                .padding(Drawing.iconPadding)
            TextField("Search".localized(language), text: $text)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }, label: {
                    Image(systemName: "xmark")
                })
                .foregroundColor(DS.Colors.Theme.secondaryText)
                .padding(Drawing.iconPadding)
            }
        }
        .frame(height: Drawing.textFieldHeight)
        .frame(maxWidth: .infinity)
        .background(DS.Colors.Theme.buttonBackground)
        .cornerRadius(Drawing.cornerRadius)
        .padding(.horizontal, Drawing.horizontalPadding)
    }
}

#Preview {
    SearchBar(text: .constant("safasf"))
}
