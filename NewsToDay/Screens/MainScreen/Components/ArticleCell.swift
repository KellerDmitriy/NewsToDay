//
//  ArticleCell.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI
import DS

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
            .foregroundStyle(DS.Colors.Theme.indigoAccent)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: Drawing.bottomLeadingPadding) {
                    Text(section.rawValue.uppercased())
                        .font(DS.Fonts.Inter12.regular400)
                    
                    Text("The latest situation in the presidential election")
                        .font(DS.Fonts.Inter16.bold700)
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
