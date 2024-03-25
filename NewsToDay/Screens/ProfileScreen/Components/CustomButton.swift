//
//  CustomButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import DS
import SwiftUI

struct CustomButton: View {
    
    enum ButtonType {
        case profile, language
    }
    
    private enum Drawing {
        static let defaultForegroundColor = DS.Colors.Theme.buttonText
        static let defaultBackground = DS.Colors.Theme.buttonBackground
        static let selectedForegroundColor = DS.Colors.Theme.whiteAccent
        static let selectedBackground = DS.Colors.Theme.indigoAccent
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
            .foregroundStyle(isSelected ? Drawing.selectedForegroundColor : Drawing.defaultForegroundColor)
            .background(isSelected ? Drawing.selectedBackground : Drawing.defaultBackground)
            .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
        }
    }
}

#Preview {
    CustomButton(title: "Language", action: {}, buttonType: .profile, isSelected: false)
}
