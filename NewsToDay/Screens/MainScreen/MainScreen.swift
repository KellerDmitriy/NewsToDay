//
//  MainScreen.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct MainScreen: View {
    let sections: [Categories]
    @Binding var query: String
    @Binding var selectedSection: Categories
    
    @Environment(\.displayScale) var scale
            
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Text("Discover things of this world")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                SearchBar(text: $query)
                
                HorizontalCategorySelectorSection(
                    sections: sections,
                    selected: $selectedSection
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
        .navigationTitle("Browse")
    }
}

#Preview {
    NavigationView {
        MainScreen(
            sections: Categories.allCases,
            query: .constant("query"),
            selectedSection: .constant(.general)
        )
    }
}
