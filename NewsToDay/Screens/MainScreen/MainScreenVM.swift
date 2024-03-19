//
//  MainScreenVM.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import Combine

final class MainScreenVM: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var sections = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    @Published var selectedSection: String? = nil
    @Published var news: [NewsResults] = []
    
    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        selectedSection = sections.first
        fetchData()
    }
    
    private func fetchData() {
        Task {
            do {
                let newsModel = try await self.networkManager.fetchData()
                    self.news = newsModel.articles ?? []
            } catch {
                print("Ошибка при получении данных: \(error)")
            }
        }
    }
}
