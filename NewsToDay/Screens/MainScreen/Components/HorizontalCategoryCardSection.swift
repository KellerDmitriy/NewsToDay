//
//  HorizontalCategoryCard.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct HorizontalCategoryCardSection: View {
    @ObservedObject var vm: MainScreenVM

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
                ForEach(vm.sections, id: \.self) { section in

                    NavigationLink {
                        MainScreenDetailView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                                .frame(width: Drawing.cardWidth, height: Drawing.cardHeight)
                                .foregroundStyle(Color.indigo)
                                .overlay(alignment: .bottomLeading) {
                                    VStack(alignment: .leading, spacing: Drawing.bottomLeadingPadding) {
                                        Text(section.description.uppercased())
                                            .font(.footnote.weight(Drawing.footnoteFontWeight))

                                        Text("The latest situation in the presidential election")
                                            .font(.headline.weight(Drawing.headlineFontWeight))
                                    }
                                    .padding()
                                }
                                .overlay(alignment: .topTrailing) {
                                    Image(systemName: "bookmark")
                                        .padding(Drawing.bookmarkImagePadding)
                                }
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HorizontalCategoryCardSection(vm: MainScreenVM())
}
