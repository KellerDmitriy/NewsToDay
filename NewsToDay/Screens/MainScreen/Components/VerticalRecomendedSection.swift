//
//  VerticalRecomendedSection.swift
//  NewsToDay
//
//  Created by dsm 5e on 18.03.2024.
//

import SwiftUI
import NetworkManager
import DS

struct VerticalRecomendedSection: View {
    
    private struct Drawing {
        static let spacing: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let imageWidth: CGFloat = 96
        static let imageHeight: CGFloat = 96
        static let headlineFontSize: CGFloat = 18
        static let headlineFontWeight: Font.Weight = .light
        static let padding: CGFloat = 16
    }
    
    let item: [NewsResults]
    
    var body: some View {
        ScrollView {
            ForEach(item.prefix(5), id: \.self) { item in
                NavigationLink {
                    MainScreenDetailView(item: item)
                } label: {
                    RecomendedCell(item: item)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        VerticalRecomendedSection(item: [NewsResults.preview, NewsResults.preview])
    }
}

