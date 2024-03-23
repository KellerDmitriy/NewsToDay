//
//  AuthButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import SwiftUI

struct AuthButton: View {
    private enum Drawing {
        static let background = "475AD7"
        static let foreground = "FFFFFF"
        static let cornerRadius: CGFloat = 12
    }
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                Spacer()
                Text(title)
                Spacer()
            }
            .padding()
            .foregroundStyle(Color(hex: Drawing.foreground))
            .background(Color(hex: Drawing.background))
            .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
        }
    }
}

#Preview {
    AuthButton(title: "Sign In", action: {})
}
