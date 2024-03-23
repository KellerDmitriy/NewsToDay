//
//  NewsToDayApp.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import SwiftUI
import DS
import FirebaseCore

@main
struct NewsToDayApp: App {    
    @AppStorage("isOnboarding") var isOnboarding = false
    @AppStorage("isSelectedCategory") var isSelectedCategory = false
        
    init() {
        FontsProvider.registerFonts()
        FirebaseApp.configure()
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : DS.Fonts.largeTitle]
    }

    var body: some Scene {
        WindowGroup {
            if !isOnboarding {
                OnboardingView(isOnboarding: $isOnboarding)
            } else if isOnboarding && !isSelectedCategory {
                CategoriesView()
            } else {
                CustomBarView()
            }
        }
    }
    
}

