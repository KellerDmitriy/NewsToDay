//
//  NewsToDayApp.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import SwiftUI

@main
struct NewsToDayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @AppStorage("isOnboarding") var isOnboarding = false
    @AppStorage("isSelectedCategory") var isSelectedCategory = false

    init() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
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

