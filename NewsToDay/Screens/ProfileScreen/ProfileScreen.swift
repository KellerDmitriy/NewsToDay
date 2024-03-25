//
//  ProfileScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct ProfileScreen: View {
    private let authManager = AuthManagerWithFirebase.shared
    
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    @State private var isShowingLanguageScreen = false
    @State private var isShowingTermsConditionsScreen = false
    @State private var isShowingSignOut = false
    @State private var signOutError: Error?
    
    //    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileHeader()
            }
            .padding()
            
            NavigationLink(destination: LanguageScreen(), isActive: $isShowingLanguageScreen) {
                EmptyView()
            }
            .hidden()
            
            CustomButton(title: "Language".localized(language),
                         imageName: "chevron.right", action: {
                isShowingLanguageScreen = true
            }, buttonType: .profile, isSelected: false)
            .padding()
            Spacer()
            
            NavigationLink(destination: TermsConditionsScreen(title: ""), isActive: $isShowingTermsConditionsScreen) {
                EmptyView()
            }
            .hidden()
            
            CustomButton(title: "Terms & Conditions".localized(language), action: {
                isShowingTermsConditionsScreen = true
            }, buttonType: .profile, isSelected: false)
            .padding()
            
            
            CustomButton(title: "Sign Out".localized(language),
                         imageName: "rectangle.portrait.and.arrow.right",
                         action: {},
                         buttonType: .profile,
                         isSelected: false)
                .padding()
                .task {
                    do {
                        try await singOutButtonTap()
                    } catch {
                        signOutError = error
                    }
                }
            
            Spacer()
            
        }
        .navigationTitle("Profile".localized(language))
        .alert(isPresented: .init(
            get: { signOutError != nil },
            set: { _ in signOutError = nil })) {
                Alert(title: Text("Error"), message: Text(signOutError?.localizedDescription ?? "Unknown error occurred"), dismissButton: .default(Text("OK")))
            }
    }
    
    private func singOutButtonTap() async throws {
        try await authManager.signOut()
    }
}

#Preview  {
    NavigationView {
        ProfileScreen()
    }
}
