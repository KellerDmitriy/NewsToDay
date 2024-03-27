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
    @Published var selectedCategory: Categories = .other
    @Published var news: [NewsResults] = []
    @Published var state: State = .empty
    @Published var lang: [Language] = [.en]
    
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
         let langString = lang.map {$0.rawValue}.joined(separator: ",")
        
        Task(priority: .high) { [weak self] in
            guard let self else { return }
            let newState = await networkManager
                .getLatestNews(lang: langString, categories: selectedCategory.rawValue)
                .map(\.results)
                .map(State.ready)
                .mapError(State.error)
                
            await MainActor.run {
                switch newState {
                case .success(let success):
                    self.state = success
                    
                case .failure(let failure):
                    self.state = failure
                }
            }
        }
    }
    
    func manage(bookmark: NewsResults) {
        switch bookmarks.contains(bookmark) {
        case true: bookmarks.remove(bookmark)
        case false: bookmarks.insert(bookmark)
        }
    }
    
    enum State: Error {
        case empty
        case loading
        case error(NetworkError)
        case ready([NewsResults])
    }
}
