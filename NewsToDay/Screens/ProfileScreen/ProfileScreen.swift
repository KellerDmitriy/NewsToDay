//
//  ProfileScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct ProfileScreen: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    @State private var isShowingLanguageScreen = false
    @State private var isShowingTermsConditionsScreen = false
    @State private var isShowingSignOut = false
    
    @State var image: Image?
    @State private var inputImage = UIImage(named: "avatar")
    
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileHeader(
                    userName: "Dev P",
                    email: "dev@gmail.com", 
                    avatar: inputImage ?? UIImage(systemName: "person.fill")!
                    )
                .onTapGesture {
                    showingImagePicker = true
                }
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
                         imageName: "arrow.right.circle", action: {
                // action
            }, buttonType: .profile, isSelected: false)
            .padding()
            Spacer()
            
        }
        .navigationTitle("Profile".localized(language))
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

#Preview  {
    NavigationView {
        ProfileScreen()
    }
}
