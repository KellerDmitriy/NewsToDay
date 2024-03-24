//
//  MainScreenHeader.swift
//  NewsToDay
//
//  Created by dsm 5e on 21.03.2024.
//

import SwiftUI
import DS

struct ScreenHeader: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    let title: String
    
    var body: some View {
        Text(title.localized(language))
            .foregroundStyle(DS.Colors.Theme.secondaryText)
            .font(DS.Fonts.Inter16.regular400)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    ScreenHeader(title: "Discover things of this world")
}
