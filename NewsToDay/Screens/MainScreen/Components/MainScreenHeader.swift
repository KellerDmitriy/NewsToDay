//
//  MainScreenHeader.swift
//  NewsToDay
//
//  Created by dsm 5e on 21.03.2024.
//

import SwiftUI
import DS

struct MainScreenHeader: View {
    var body: some View {
        Text("Discover things of this world")
            .foregroundStyle(DS.Colors.Theme.secondaryText)
            .font(DS.Fonts.Inter16.regular400)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    MainScreenHeader()
}
