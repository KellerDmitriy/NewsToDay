//
//  NewsToDayApp.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import Firebase
import SwiftUI

@main
struct NewsToDayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @AppStorage("isOnboarding") var isOnboarding = false
    @AppStorage("isSelectedCategory") var isSelectedCategory = false
    
    @StateObject var viewModel = AuthViewModel() // мои правки для firebase
    
    init() { // мои правки для firebase
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if !isOnboarding {
                OnboardingView(isOnboarding: $isOnboarding)
            } else if isOnboarding && !isSelectedCategory {
                CategoriesView()
            } else {
                CustomBarView()
                .environmentObject(viewModel) // мои правки для firebase
            }
        }
    }
}

