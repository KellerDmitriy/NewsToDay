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
            
            ProfileButton(title: "Language") {
                isShowingLanguageScreen = true
            }
            .padding()
            Spacer()
            
            NavigationLink(destination: TermsConditionsScreen(title: ""), isActive: $isShowingTermsConditionsScreen) {
                EmptyView()
            }
            .hidden()
            
            ProfileButton(title: "Terms & Conditions") {
                isShowingTermsConditionsScreen = true
            }
            .padding()
            
            
            ProfileButton(title: "Sign Out", imageName: "arrow.right.circle") {
                // action
            }
            .padding()
            Spacer()
            
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationView {
        ProfileScreen()
    }
}
