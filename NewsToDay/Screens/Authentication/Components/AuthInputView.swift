//
//  AuthInputView.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import SwiftUI

struct AuthInputView: View {
    
    private enum Drawing {
        static let borderColor = "475AD7"
        static let activeBackground = "FFFFFF"
        static let foreground = "7C82A1"
        static let background = "F3F4F6"
        static let cornerRadius: CGFloat = 12
    }
    
    @Binding var text: String
    let imageName: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack {
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color(hex: Drawing.background))
                    .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color(hex: Drawing.background))
                    .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
            }
        }
    }
}

#Preview {
    AuthInputView(text: .constant(""), imageName: "envelope.fill", placeholder: "Email Adres")
}
