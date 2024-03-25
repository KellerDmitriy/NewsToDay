//
//  AuthTextButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import DS
import SwiftUI

struct AuthTextButton: View {
    private enum Drawing {
        static let fontSize: CGFloat = 16
        static let foregroundColor = DS.Colors.Theme.primaryText
    }
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                    Text(title)
                        .font(.system(size: Drawing.fontSize))
                        .foregroundStyle(Drawing.foregroundColor)
            }
        }
    }
}

#Preview {
    AuthTextButton(title: "Don't have an account? Sign Up", action: {})
}

