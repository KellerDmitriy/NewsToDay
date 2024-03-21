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
            
            CustomButton(title: "Language".localized, imageName: "chevron.right", action: {
                isShowingLanguageScreen = true
            }, buttonType: .profile, isSelected: false)
            .padding()
            Spacer()
            
            NavigationLink(destination: TermsConditionsScreen(title: ""), isActive: $isShowingTermsConditionsScreen) {
                EmptyView()
            }
            .hidden()
            
            CustomButton(title: "Terms & Conditions".localized, action: {
                isShowingTermsConditionsScreen = true
            }, buttonType: .profile, isSelected: false)
            .padding()
            
            
            CustomButton(title: "Sign Out".localized, imageName: "arrow.right.circle", action: {
                // action
            }, buttonType: .profile, isSelected: false)
            .padding()
            Spacer()
            
        }
        .navigationTitle("Profile")
    }
}

#Preview  {
    NavigationView {
        ProfileScreen()
    }
}
