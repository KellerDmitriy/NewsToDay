//
//  HorizontalCategoryCard.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import NetworkManager

struct HorizontalCategoryCardSection: View {
    
    @EnvironmentObject var vm: MainScreenVM
    var articles: [NewsResults]
    var category: Categories

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(articles) { section in
                    NavigationLink {
                        MainScreenDetailView(item: section)
                    } label: {
                        ArticleCell(rawImage: nil, news: section, category: category)
                            .environmentObject(vm)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationView {
        HorizontalCategoryCardSection(articles: [NewsResults.preview, NewsResults.preview], category: .business)
            .environmentObject(MainScreenVM())
    }
}
