//
//  MainScreenVM.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import Combine

final class MainScreenVM: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var sections: [Categories] = []
    @Published var selectedSection: Categories
    @Published var news: [NewsResults] = []
    @Published var state: State = .empty
    
    private let networkManager = NetworkManager.shared

    init() {
        sections = Categories.allCases
        selectedSection = .general
    }
    
//    private func fetchData() {
//        Task {
//            do {
//                let newsModel = try await self.networkManager.fetchData(with: selectedSection ?? "")
//                await MainActor.run {
//                    self.news = newsModel.articles ?? []
//                }
//            } catch {
//                print("Ошибка при получении данных: \(error)")
//            }
//        }
//    }
    
    func onAppear() {
        state = .loading
        Task(priority: .high) { [weak self] in
            guard let self else { return }
            let newState = await networkManager
                .fetch(.newsFor(category: selectedSection.rawValue))
                .map(\.articles)
                .map { $0.map(State.ready) }
                .mapError(State.error)
                
            await MainActor.run {
                switch newState {
                case .success(let success):
                    success.map { new in
                        self.state = new
                    }
                    
                case .failure(let failure):
                    self.state = failure
                }
            }
        }
    }
    
    enum State: Error {
        case empty
        case loading
        case error(NetworkError)
        case ready([NewsResults])
    }
}
