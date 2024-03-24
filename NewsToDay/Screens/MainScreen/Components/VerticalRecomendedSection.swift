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
            if !item.isEmpty{
                ForEach(item.prefix(5), id: \.self) { item in
                    NavigationLink {
                        MainScreenDetailView(item: item, isBookmark: false) {
                            
                        }
                    } label: {
                        RecomendedCell(item: item)
                    }
                }
            } else {
                Text("No results for this category")
                    .font(DS.Fonts.Inter28.bold700)
                    .foregroundStyle(DS.Colors.Theme.indigoAccent)
            }
        }
    }
}

#Preview {
    NavigationView {
        VerticalRecomendedSection(item: [NewsResults.preview, NewsResults.preview])
    }
}

