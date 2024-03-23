//
//  ArticleCell.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI
import DS
import NetworkManager

struct ArticleCell: View {
    
    private struct Drawing {
        static let cardWidth: CGFloat = 256
        static let cardHeight: CGFloat = 256
        static let cornerRadius: CGFloat = 12
        static let bottomLeadingPadding: CGFloat = 12
        static let footnoteFontWeight: Font.Weight = .light
        static let headlineFontWeight: Font.Weight = .bold
        static let bookmarkImagePadding: CGFloat = 30
    }
    
    let rawImage: CGImage?
    let news: NewsResults
    let category: Categories
    
    @Environment(\.displayScale) var scale
    @State private var isBookmark = false
    
    var body: some View {
        ZStack {
            Group {
                switch rawImage.map({ Image(decorative: $0, scale: scale) }) {
                case .some(let image):
                    image
                    
                case .none:
                    RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                }
            }
            .frame(width: Drawing.cardWidth, height: Drawing.cardHeight)
            .foregroundStyle(DS.Colors.Theme.indigoAccent)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: Drawing.bottomLeadingPadding) {
                    Text(category.rawValue.uppercased())
                        .font(DS.Fonts.Inter12.regular400)
                    
                    Text(news.title ?? "Some title")
                        .font(DS.Fonts.Inter16.bold700)
                        .multilineTextAlignment(.leading)
                }
                .padding()
            }
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    isBookmark.toggle()
                }, label: {
                    Image(systemName: isBookmark ? "bookmark.fill" : "bookmark")
                        .font(.title)
                        .foregroundColor(isBookmark ? .red : DS.Colors.Theme.whiteAccent)
                })
                .padding(Drawing.bookmarkImagePadding)
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ArticleCell(rawImage: nil, news: NewsResults.preview, category: .business)
}
