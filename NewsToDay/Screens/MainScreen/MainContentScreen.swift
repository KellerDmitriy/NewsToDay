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
                MainScreenWithShimmer(
                    selectedSections: $viewModel.selectedCategory
                )
            case .error(let networkError):
                VStack {
                    Text("Error\(networkError.localizedDescription)")
                    Button("Reload") {
                        viewModel.onAppear()
                    }
                }
                
            case .ready(let articles):
                MainScreen(
                    query: $viewModel.searchText,
                    selectedCategory: $viewModel.selectedCategory,
                    categories: $viewModel.categories,
                    articles: articles
                )
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
