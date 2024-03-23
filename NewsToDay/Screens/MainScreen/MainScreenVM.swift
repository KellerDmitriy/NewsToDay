//
//  MainScreenVM.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import Combine
import Foundation
import NetworkManager

final class MainScreenVM: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var categories: Set<Categories> = []
    @Published var bookmarks: Set<NewsResults> = []
    @Published var selectedCategory: Categories = .general
    @Published var news: [NewsResults] = []
    @Published var state: State = .empty
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    private let networkManager = NetworkManager.shared
    private var cancellables: Set<AnyCancellable> = []
        
    init() {
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.onChangeSearch()
                print("change text")
            }
            .store(in: &cancellables)
    }
    
    func onChangeSearch() {
        
    }
    
    func onAppear() {
        state = .loading
        if let firstCategory = categories.first {
            selectedCategory = firstCategory
        }
        Task(priority: .high) { [weak self] in
            guard let self else { return }
            let newState = await networkManager
                .getNewsFor(category: selectedCategory.rawValue)
                .map(\.articles)
                .map { $0.map(State.ready) }
                .mapError(State.error)
                
            await MainActor.run {
                switch newState {
                case .success(let success):
                    self.state = success ?? .error(.noData)
                case .failure(let failure):
                    self.state = failure
                }
            }
        }
    }
    
    func addToBookmarks(bookmark: NewsResults) {
        self.bookmarks.insert(bookmark)
    }
    
    enum State: Error {
        case empty
        case loading
        case error(NetworkError)
        case ready([NewsResults])
    }
}
