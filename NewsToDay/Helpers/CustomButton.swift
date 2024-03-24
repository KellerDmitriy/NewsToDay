//
//  CustomButton.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI
import DS

struct CustomButton: View {
    
    enum ButtonType {
        case profile, language
    }
    
    private enum Drawing {
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
            .foregroundStyle(isSelected
                             ? DS.Colors.Theme.whiteAccent
                             : DS.Colors.Theme.buttonText
            )
            .background(isSelected
                        ? DS.Colors.Theme.indigoAccent
                        : DS.Colors.Theme.buttonBackground
                        )
            .clipShape(RoundedRectangle(cornerRadius: Drawing.cornerRadius))
        }
    }
}

#Preview {
    CustomButton(title: "Language", action: {}, buttonType: .profile, isSelected: false)
}
