//
//  MainScreenWithShimmer.swift
//  NewsToDay
//
//  Created by dsm 5e on 23.03.2024.
//

import SwiftUI
import NetworkManager

struct MainScreenWithShimmer: View {
    let sections = Categories.allCases
    @State var query: String = ""
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                ScreenHeader(title: "Discover things of this world".localized(language))
                SearchBar(text: $query)
                
                HorizontalSelector(sections) { category in
                    CategoryCell(category: category, selected: .constant(.lifestyle))
                }
                .redacted(reason: .placeholder)
                .shimmering()
                
                HorizontalSelector([NewsResults.preview, NewsResults.preview]) { news in
                    ArticleCell(nil, title: "", description: "", isBookmark: false, action: {})
                }
                .redacted(reason: .placeholder)
                .shimmering()
                
                SectionTitle(
                    sectionTitle: "Recomended for you".localized(language),
                    buttonTitle: "See all".localized(language),
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
