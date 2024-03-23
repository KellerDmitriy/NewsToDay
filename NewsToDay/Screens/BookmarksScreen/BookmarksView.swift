//
//  BookmarksView.swift
//  NewsToDay
//
//  Created by dsm 5e on 23.03.2024.
//

import SwiftUI
import DS

struct BookmarksView: View {
    
    @EnvironmentObject var viewModel: MainScreenVM
    
    var body: some View {
        VStack {
            ScreenHeader(title: "Saved articles to the library")
            if viewModel.bookmarks.isEmpty {
                VStack(spacing: 24) {
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 72, height: 72)
                            .foregroundColor(DS.Colors.Theme.indigoAccent.opacity(0.5))
                        Image(systemName: "text.book.closed")
                            .font(DS.Fonts.Inter28.extraBold)
                            .foregroundColor(DS.Colors.Theme.whiteAccent)
                    }
                    
                    Text("You haven't saved any articles yet. Start reading and bookmarking them now")
                        .font(DS.Fonts.Inter16.medium500)
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                
            } else {
                ScrollView {
                    ForEach(Array(viewModel.bookmarks)) { bookmark in
                        NavigationLink {
                            MainScreenDetailView(item: bookmark)
                        } label: {
                            RecomendedCell(item: bookmark)
                        }
                    }
                }
            }
        }
        .navigationTitle("Bookmarks")
    }
}

#Preview {
    NavigationView {
        BookmarksView()
            .environmentObject(MainScreenVM())
    }
}
