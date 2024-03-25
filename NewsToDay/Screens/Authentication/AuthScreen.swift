//
//  AuthScreen.swift
//  NewsToDay
//
//  Created by Келлер Дмитрий on 17.03.2024.
//

import SwiftUI

struct AuthScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpActive = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthTitle(title: "I am happy to see you again. You can continue where you left off by logging in")
                .padding()
            VStack(spacing: 20) {
                AuthInputView(text: $email, isSecureField: false, imageName: "envelope.fill", placeholder: "Email Adres")
                    .autocapitalization(.none)
                AuthInputView(text: $password, isSecureField: true, imageName: "lock", placeholder: "Password")
            }
            .padding()
            Spacer()
            AuthButton(title: "Sign In") {
                Task {
                    try await authViewModel.signIn(withEmail: email, password: password)
                }
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5) 
            .padding()
            Spacer()
            NavigationLink(destination: RegistrationScreen().navigationBarBackButtonHidden(), isActive: $isSignUpActive) {
                AuthTextButton(title: "Don't have an account? Sign Up") {
                    isSignUpActive = true
                }
            }
        }
        .navigationTitle("Welcome Back ")
    }
}


// MARK: - AuthenticationFormProtocol 

extension AuthScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    NavigationView {
        AuthScreen()
    }
}
