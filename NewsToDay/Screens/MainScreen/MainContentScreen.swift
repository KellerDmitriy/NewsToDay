//
//  MainContentScreen.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 19.03.2024.
//

import SwiftUI

struct MainContentScreen: View {
    @StateObject var viewModel = MainScreenVM()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .empty:
                EmptyView()
                
            case .loading:
                ProgressView()
                
            case .error(let networkError):
                EmptyView()
                
            case .ready(let articles):
                MainScreen(
                    sections: viewModel.sections,
                    query: $viewModel.searchText,
                    selectedSection: $viewModel.selectedSection
                )
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    MainContentScreen()
}
