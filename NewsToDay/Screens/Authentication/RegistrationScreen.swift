//
//  RegistrationScreen.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import SwiftUI

struct RegistrationScreen: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            AuthTitle(title: "Hello, I guess you are new around here. You can start using the application after sign up.")
            AuthInputView(text: $userName, imageName: "", placeholder: "Username")
            AuthInputView(text: $email, imageName: "", placeholder: "Email")
            AuthInputView(text: $password, imageName: "", placeholder: "Password", isSecureField: true)
            AuthInputView(text: $repeatPassword, imageName: "", placeholder: "Repeat Password", isSecureField: true)
            AuthButton(title: "Sing Up", action: {})
            
            Spacer()
            AuthTextButton(title: "Already have an account? Sign In") {
                dismiss()
            }
        }
        .padding()
        .navigationTitle("Welcome to News")
    }
}

#Preview {
    NavigationView {
        RegistrationScreen()
    }
}
