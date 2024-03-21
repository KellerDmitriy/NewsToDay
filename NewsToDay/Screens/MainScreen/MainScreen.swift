//
//  MainScreen.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import DS

struct MainScreen: View {
    
    @Binding var query: String
    @Binding var selectedSection: Categories
    
    let sections: [Categories]
            
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                MainScreenHeader()
                
                SearchBar(text: $query)
                
                HorizontalCategorySelectorSection(
                    sections: sections,
                    selected: selectedSection
                )
                
                HorizontalCategoryCardSection(sections: sections)
                
                SectionTitle(
                    sectionTitle: "Recomended for you",
                    buttonTitle: "See all",
                    item: EmptyView()
                )
                
                VerticalRecomendedSection()
            }
        }
    }
}

#Preview {
    NavigationView {
        MainScreen(
            query: .constant("query"),
            selectedSection: .constant(.business),
            sections: Categories.allCases
        )
    }
}
