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
                Text("Empty")
                
            case .loading:
                ProgressView()
                
            case .error(let networkError):
                Text("Error")
                
            case .ready(let articles):
                MainScreen(
                    query: $viewModel.searchText,
                    selectedSection: $viewModel.selectedSection,
                    sections: viewModel.sections
                )
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .navigationTitle("Browse")
    }
}

#Preview {
    MainContentScreen()
}
