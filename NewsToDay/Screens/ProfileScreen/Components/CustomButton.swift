//
//  CustomButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct CustomButton: View {
    
    enum ButtonType {
        case profile, language
    }
    
    private enum Drawing {
        static let defaultForegroundColor = "666C8E"
        static let defaultBackground = "F3F4F6"
        static let selectedForegroundColor = "FFFFFF"
        static let selectedBackground = "475AD7"
        static let cornerRadius: CGFloat = 12
    }
    
    let title: String
    var imageName: String?
    let action: () -> Void
    let buttonType: ButtonType
    let isSelected: Bool
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if buttonType == .profile {
                    Image(systemName: imageName ?? "chevron.right")
                } else {
                    if isSelected {
                        Image(systemName: "checkmark")
                    } else {
                        Image(systemName: "")
                    }
                }
            }
            .padding()
            .foregroundStyle(Color(hex: isSelected ? Drawing.selectedForegroundColor : Drawing.defaultForegroundColor))
            .background(Color(hex: isSelected ? Drawing.selectedBackground : Drawing.defaultBackground))
            .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
        }
    }
}

#Preview {
    CustomButton(title: "Language", action: {}, buttonType: .profile, isSelected: false)
}
