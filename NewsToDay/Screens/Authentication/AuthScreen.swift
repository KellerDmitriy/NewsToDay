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
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            VStack {
                AuthTitle(title: "I am happy to see you again. You can continue where you left off by logging in")
                    .padding()
                VStack(spacing: 20) {
                    AuthInputView(text: $email, imageName: "envelope.fill", placeholder: "Emeil Adres")
                        .autocapitalization(.none)
                    AuthInputView(text: $password, imageName: "lock", placeholder: "Password", isSecureField: true)
                
                }
                .padding()
                Spacer()
                AuthButton(title: "Sign In") {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }
                .disabled(!formIsValid) // validation
                .opacity(formIsValid ? 1.0 : 0.5) // validation
                    .padding()
                Spacer()
                NavigationLink(destination: RegistrationScreen().navigationBarBackButtonHidden(), isActive: $isSignUpActive) {
                    AuthTextButton(title: "Don't have an account? Sign Up") {
                        Task {
                            try await viewModel.createUsers(withEmail: email, userName: "", password: password)
                        }
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
