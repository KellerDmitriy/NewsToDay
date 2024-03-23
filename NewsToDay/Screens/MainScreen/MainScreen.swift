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
    
    @Binding var query: String
    @Binding var selectedCategory: Categories
    @Binding var categories: Set<Categories>
    
    let articles: [NewsResults]
            
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                MainScreenHeader()
                
                SearchBar(text: $query)
                
                HorizontalCategorySelectorSection(
                    categories: categories,
                    selected: $selectedCategory
                )
                
                HorizontalCategoryCardSection(
                    articles: articles,
                    category: selectedCategory
                )
                
                SectionTitle(
                    sectionTitle: "Recomended for you".localized,
                    buttonTitle: "See all".localized,
                    item: EmptyView()
                )
                
                VerticalRecomendedSection(item: articles)
            }
        }
    }
}

#Preview {
    NavigationView {
        MainScreen(
            query: .constant("query"),
            selectedCategory: .constant(.business), categories: .constant(Set(Categories.allCases)),
            articles: [NewsResults.preview, NewsResults.preview]
        )
    }
}
