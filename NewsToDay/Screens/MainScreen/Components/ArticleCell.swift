//
//  ArticleCell.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI
import DS
import NetworkManager

struct ArticleDetailView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.body)
                .fontWeight(.bold)
                .padding(.bottom, 12)
            Text(description)
                .font(.body)
                .lineLimit(nil) 
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(Color.gray.opacity(0.5))
    }
}

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
    
    @Environment(\.displayScale) private var scale
    @StateObject private var imageLoader = ImageLoader()
    
    let imageURL: URL?
    let title: String
    let description: String
    let isBookmark: Bool
    let action: () -> Void
   
    var body: some View {
        ZStack {
            Group {
                if let uiImage = imageLoader.image {
                    Image(uiImage: uiImage)
                        .resizable()
                } else {
                    RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                }
            }
            .frame(
                width: Drawing.cardWidth,
                height: Drawing.cardHeight
            )
            .foregroundStyle(DS.Colors.Theme.indigoAccent)
            .overlay(alignment: .bottomLeading) {
                
                ArticleDetailView(
                    title: title,
                    description: description
                )
                .padding(Drawing.bottomLeadingPadding)
                .cornerRadius(Drawing.cornerRadius)
            }
            
            .overlay(alignment: .topTrailing) {
                Button(action: action) {
                    Image(systemName: isBookmark ? "bookmark.fill" : "bookmark")
                        .font(.title)
                        .foregroundColor(isBookmark ? .red : DS.Colors.Theme.whiteAccent)
                }
                .padding(Drawing.bookmarkImagePadding)
            }
        }
        .foregroundColor(.white)
        .cornerRadius(Drawing.cornerRadius)
        .onAppear {
            if let imageURL = imageURL {
                imageLoader.loadImage(from: imageURL)
            }
        }
    }
    
    init(
        imageURL: URL?,
        title: String,
        description: String,
        isBookmark: Bool,
        action: @escaping () -> Void
    ) {
        self.imageURL = imageURL
        self.title = title
        self.description = description
        self.isBookmark = isBookmark
        self.action = action
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ArticleCell(imageURL: URL(string: ""), title: "Title1", description: "Description1", isBookmark: true, action: {})
            ArticleCell(imageURL: URL(string: ""), title: "Title2", description: "Description2", isBookmark: false, action: {})
        }
    }
}
