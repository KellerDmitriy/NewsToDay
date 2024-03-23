//
//  MainScreenWithShimmer.swift
//  NewsToDay
//
//  Created by dsm 5e on 23.03.2024.
//

import SwiftUI
import NetworkManager

struct MainScreenWithShimmer: View {
    
    @State var query: String = ""
    
    let sections: Set<Categories> = Set(Categories.allCases)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                MainScreenHeader()
                
                SearchBar(text: $query)
                
                HorizontalCategorySelectorSection(
                    categories: sections,
                    selected: .constant(.business)
                )
                .redacted(reason: .placeholder)
                .shimmering()
                
                HorizontalCategoryCardSection(
                    articles: [
                        NewsResults.preview,
                        NewsResults.preview
                    ],
                    category: sections.first!
                )
                    .redacted(reason: .placeholder)
                    .shimmering()
                
                SectionTitle(
                    sectionTitle: "Recomended for you".localized,
                    buttonTitle: "See all".localized,
                    item: EmptyView()
                )
                
                VerticalRecomendedSection(item: [
                    NewsResults.preview,
                    NewsResults.preview,
                    NewsResults.preview,
                ])
                    .redacted(reason: .placeholder)
                    .shimmering()
            }
            .disabled(true)
        }
    }
}

#Preview {
    MainScreenWithShimmer()
}
