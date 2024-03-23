//
//  MainContentScreen.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI
import DS


struct MainContentScreen: View {
    @EnvironmentObject var viewModel: MainScreenVM
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .empty:
                Text("Empty")
            case .loading:
                MainScreenWithShimmer()
                
                
            case .error(let networkError):
                ErrorView(error: networkError) {
                    viewModel.onAppear()
                }
                
            case .ready(let articles):
                MainScreen(
                    query: $viewModel.searchText,
                    selectedCategory: $viewModel.selectedCategory,
                    categories: $viewModel.categories,
                    isSearching: viewModel.isSearching,
                    articles: articles
                )
                .environmentObject(viewModel)
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .navigationTitle("Browse".localized)
    }
}

#Preview {
    MainContentScreen()
        .environmentObject(MainScreenVM())
}
