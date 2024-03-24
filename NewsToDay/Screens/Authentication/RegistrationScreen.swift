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
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            AuthTitle(title: "Hello, I guess you are new around here. You can start using the application after sign up.")
            AuthInputView(text: $userName, imageName: "", placeholder: "Username")
            AuthInputView(text: $email, imageName: "", placeholder: "Email")
                .autocapitalization(.none)
            AuthInputView(text: $password, imageName: "", placeholder: "Password", isSecureField: true)
            ZStack(alignment: .trailing) {
                AuthInputView(text: $repeatPassword, imageName: "", placeholder: "Repeat Password", isSecureField: true)
                if !password.isEmpty && !repeatPassword.isEmpty {
                    if password == repeatPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.green)
                            .padding(.trailing)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                            .padding(.trailing)
                    }
                }
            }
            
            AuthButton(title: "Sign Up") {
                Task {
                    try await viewModel.createUsers(withEmail: email, userName: userName, password: password)
                }
            }
            .disabled(!formIsValid) // validation
            .opacity(formIsValid ? 1.0 : 0.5) // validation
            
            Spacer()
            AuthTextButton(title: "Already have an account? Sign In") {
                dismiss()
            }
        }
        .padding()
        .navigationTitle("Welcome to News")
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !userName.isEmpty
        && !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && repeatPassword == password
    }
}

#Preview {
    NavigationView {
        RegistrationScreen()
    }
}
