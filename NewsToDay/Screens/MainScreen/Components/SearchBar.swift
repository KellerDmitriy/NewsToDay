//
//  SearchBar.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String

    private struct Drawing {
        static let iconPadding: CGFloat = 8
        static let iconName: String = "magnifyingglass"
        static let iconColorOpacity: Double = 0.6
        static let textFieldHeight: CGFloat = 55
        static let backgroundColorOpacity: Double = 0.2
        static let cornerRadius: CGFloat = 12
        static let horizontalPadding: CGFloat = 16
    }

    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: Drawing.iconName)
                .foregroundColor(Color.gray.opacity(Drawing.iconColorOpacity))
                .padding(Drawing.iconPadding)
            TextField("Search", text: $text)
        }
        .frame(height: Drawing.textFieldHeight)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(Drawing.backgroundColorOpacity))
        .cornerRadius(Drawing.cornerRadius)
        .padding(.horizontal, Drawing.horizontalPadding)
    }
}

#Preview {
    SearchBar(text: .constant("asdda"))
}
