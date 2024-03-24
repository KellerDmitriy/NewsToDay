//
//  ProfileScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var isShowingLanguageScreen = false
    @State private var isShowingTermsConditionsScreen = false
    @State private var isShowingSignOut = false
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileHeader(userName: "Dev P", email: "dev@gmail.com", imageName: "avatar")
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
                         imageName: "rectangle.portrait.and.arrow.right", action: {
                viewModel.signOut()
            }, buttonType: .profile, isSelected: false)
            .padding()
            Spacer()
            
        }
        .navigationTitle("Profile".localized(language))
    }
}

#Preview  {
    NavigationView {
        ProfileScreen()
    }
}
