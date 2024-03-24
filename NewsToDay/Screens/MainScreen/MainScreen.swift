//
//  MainScreen.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import DS
import NetworkManager

struct MainScreen: View {
    @EnvironmentObject var vm: MainScreenVM
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    @Binding var query: String
    @Binding var selectedCategory: Categories
    @Binding var categories: Set<Categories>
    var isSearching: Bool
    
    let articles: [NewsResults]
            
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                ScreenHeader(title: "Discover things of this world")
                SearchBar(text: $query)
                
                if !isSearching {
                    HorizontalSelector(Array(categories), spacing: 0) { category in
                        CategoryCell(category: category, selected: $selectedCategory)
                    }
                    HorizontalSelector(articles) { news in
                        NavigationLink(destination: MainScreenDetailView(item: news)) {
                            ArticleCell(
                                nil,
                                title: selectedCategory.rawValue.uppercased(),
                                description: news.title ?? "No title",
                                isBookmark: vm.bookmarks.contains(news),
                                action: { vm.manage(bookmark: news) }
                            )
                        }
                    }
                    SectionTitle(
                        sectionTitle: "Recomended for you".localized(language),
                        buttonTitle: "See all".localized(language),
                        item: EmptyView()
                    )
                    VerticalRecomendedSection(item: articles)
                } else {
                    VerticalRecomendedSection(item: articles)
                }
            }
        }
        .animation(.bouncy, value: isSearching)
    }
}

#Preview {
    NavigationView {
        MainScreen(
            query: .constant("query"),
            selectedCategory: .constant(.business),
            categories: .constant(Set(Categories.allCases)),
            isSearching: false,
            articles: [NewsResults.preview, NewsResults.preview]
        )
        .environmentObject(MainScreenVM())
    }
}
