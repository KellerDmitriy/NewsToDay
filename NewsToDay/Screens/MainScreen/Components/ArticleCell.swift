//
//  ArticleCell.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI

struct ArticleCell: View {
    let rawImage: CGImage?
    let section: Categories
    
    @Environment(\.displayScale) var scale
    
    private struct Drawing {
        static let cardWidth: CGFloat = 256
        static let cardHeight: CGFloat = 256
        static let cornerRadius: CGFloat = 12
        static let bottomLeadingPadding: CGFloat = 12
        static let footnoteFontWeight: Font.Weight = .light
        static let headlineFontWeight: Font.Weight = .bold
        static let bookmarkImagePadding: CGFloat = 12
    }
    
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
            .foregroundStyle(Color.indigo)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: Drawing.bottomLeadingPadding) {
                    Text(section.rawValue.uppercased())
                        .font(.footnote.weight(Drawing.footnoteFontWeight))
                    
                    Text("The latest situation in the presidential election".localized)
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

#Preview {
    ArticleCell(rawImage: nil, section: .business)
}
