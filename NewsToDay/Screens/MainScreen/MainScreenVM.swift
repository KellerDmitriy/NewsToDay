//
//  MainScreenVM.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import Foundation

final class MainScreenVM: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var sections = ["Random", "Sports", "Gaming", "Politics", "Life"]
    @Published var selectedSection: String? = nil

    init() {
        selectedSection = sections.first
    }

}
