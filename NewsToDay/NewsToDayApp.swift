//
//  NewsToDayApp.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import SwiftUI

@main
struct NewsToDayApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding = false

    var body: some Scene {
        WindowGroup {
            if !isOnboarding {
                OnboardingView(isOnboarding: $isOnboarding)
            } else {
                MainScreen()
            }
        }
    }
}
