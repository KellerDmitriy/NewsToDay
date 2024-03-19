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
    
    private struct Drawing {
        static let cardWidth: CGFloat = 256
        static let cardHeight: CGFloat = 256
        static let cornerRadius: CGFloat = 12
        static let bottomLeadingPadding: CGFloat = 12
        static let footnoteFontSize: CGFloat = 12
        static let footnoteFontWeight: Font.Weight = .light
        static let headlineFontSize: CGFloat = 18
        static let headlineFontWeight: Font.Weight = .bold
        static let bookmarkImagePadding: CGFloat = 12
    }

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
