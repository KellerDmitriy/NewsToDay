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
      
    //MARK: - init(_:)
    init() {
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.onChangeSearch()
                print("change text")
            }
            .store(in: &cancellables)
    }
    
    //MARK: - public methods
    func onChangeSearch() {
        
    }
    
    func onAppear() {
        state = .loading
        let langString = lang.map {$0.rawValue}.joined(separator: ",")
        
        Task(priority: .high) { [weak self] in
            guard let self else { return }
            
            let screenModel = await Result(asyncCatch: mainScreenInfo)
                .mapError(NetworkError.init)
                .map(State.ready)
                .mapError(State.error)
            
            await MainActor.run {
                switch screenModel {
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
    
    //MARK: - Types
    struct News {
        var selectedCategory: [NewsResults] = .init()
        var recommendedNews: [NewsResults] = .init()
    }
    
    enum NewsType {
        case selected([NewsResults])
        case recommended([NewsResults])
    }
    
    enum State: Error {
        case empty
        case loading
        case error(NetworkError)
        case ready(News)
    }
}

private extension MainScreenVM {
    func mainScreenInfo() async throws -> News {
        try await withThrowingTaskGroup(of: NewsType.self, returning: News.self) { [weak self] group in
            guard let self else {
                group.cancelAll()
                throw URLError(.badURL)
            }
            let langString = lang.map(\.rawValue).joined(separator: ",")
            
            group.addTask {
                try await self.networkManager
                    .getLatestNews(lang: langString, categories: self.selectedCategory.rawValue)
                    .map(\.results)
                    .map(NewsType.selected)
                    .get()
            }
            
            group.addTask {
                try await self.networkManager
                    .getLatestNews()
                    .map(\.results)
                    .map(NewsType.recommended)
                    .get()
            }
            
            return try await group.reduce(into: News()) { partialResult, results in
                switch results {
                case .recommended(let recommended):
                    partialResult.recommendedNews = recommended
                    
                case .selected(let selected):
                    partialResult.selectedCategory = selected
                }
            }
        }
    }
    
}
