//
//  AuthTitle.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import DS
import SwiftUI

struct AuthTitle: View {
    private enum Drawing {
        static let fontSize: CGFloat = 16
        static let titleColor = DS.Colors.Theme.secondaryText
    }

    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: Drawing.fontSize))
                .foregroundStyle(Drawing.titleColor)
        }
    }
}

#Preview {
    AuthTitle(title: "I am happy to see you again. You can continue where you left off by logging in")
       
}
