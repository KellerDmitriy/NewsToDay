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
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            AuthTitle(title: "Hello, I guess you are new around here. You can start using the application after sign up.")
            AuthInputView(text: $userName, isSecureField: false, imageName: "", placeholder: "Username")
            AuthInputView(text: $email, isSecureField: false, imageName: "", placeholder: "Email")
                .autocapitalization(.none)
            AuthInputView(text: $password, isSecureField: true, imageName: "", placeholder: "Password")
            ZStack(alignment: .trailing) {
                AuthInputView(text: $repeatPassword, isSecureField: true, imageName: "", placeholder: "Repeat Password")
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
                    try await authViewModel.createUsers(withEmail: email,
                                                    userName: userName,
                                                    password: password)
                }
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5) 
            Spacer()
            AuthTextButton(title: "Already have an account? Sign In") {
                dismiss()
            }
        }
        .padding()
        .navigationTitle("Welcome to NewsToDay")
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
