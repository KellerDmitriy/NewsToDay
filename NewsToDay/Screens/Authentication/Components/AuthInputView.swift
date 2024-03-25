//
//  AuthInputView.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import DS
import SwiftUI

struct AuthInputView: View {
    
    enum FocusedField {
        case email
        case password
    }
    
    private enum Drawing {
        static let borderColor = DS.Colors.Theme.indigoAccent
        static let activeBackground = DS.Colors.Theme.whiteAccent
        static let foreground = DS.Colors.Theme.buttonText
        static let background = DS.Colors.Theme.buttonBackground
        static let cornerRadius: CGFloat = 12
    }
    
    @Binding var text: String
    @FocusState private var focusedField: FocusedField?
    var isSecureField: Bool
    
    let imageName: String
    let placeholder: String
    
    var body: some View {
        VStack {
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .focused($focusedField, equals: .password)
                    .padding()
                    .background(focusedField == .password ? Drawing.activeBackground : Drawing.background)
                    .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
                    .background(
                        RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                            .stroke(focusedField == .password ? Drawing.borderColor : Drawing.background, lineWidth: 2)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .focused($focusedField, equals: .email)
                    .padding()
                    .background(focusedField == .email ? Drawing.activeBackground : Drawing.background)
                    .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
                    .background(
                        RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                            .stroke(focusedField == .email ? Drawing.borderColor : Drawing.background, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    AuthInputView(text: .constant(""), isSecureField: false, imageName: "envelope.fill", placeholder: "Email Adres")
}


