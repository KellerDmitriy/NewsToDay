//
//  ProfileButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct ProfileButton: View {
    
    private enum Drawing {
        static let forgroundColor = "666C8E"
        static let background = "F3F4F6"
        static let cornerRadius: CGFloat = 12
    }
    
    let title: String
    var imageName: String = "chevron.right"
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: imageName)
            }
            .padding()
            .foregroundStyle(Color(hex: Drawing.forgroundColor))
            .background(Color(hex: Drawing.background))
            .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
        }
    }
}

#Preview {
    ProfileButton(title: "Language", action: {})
}

