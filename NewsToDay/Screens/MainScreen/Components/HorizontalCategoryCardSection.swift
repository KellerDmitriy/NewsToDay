//
//  HorizontalCategoryCard.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct HorizontalCategoryCardSection: View {
    
    let sections: [Categories]
    var news: [NewsResults] = []

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(sections) { section in
                    NavigationLink {
                        MainScreenDetailView()
                    } label: {
                        ArticleCell(
                            rawImage: nil,
                            section: section
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationView {
        HorizontalCategoryCardSection(sections: Categories.allCases)
    }
}
