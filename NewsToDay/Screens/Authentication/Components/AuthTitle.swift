//
//  AuthTitle.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 23.03.2024.
//

import SwiftUI

struct AuthTitle: View {
    private enum Drawing {
        static let fontSize: CGFloat = 16
        static let titleColor = "7C82A1"
    }

    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: Drawing.fontSize))
                .foregroundStyle(Color(hex: Drawing.titleColor))
        }
    }
}

#Preview {
    AuthTitle(title: "I am happy to see you again. You can continue where you left off by logging in")
       
}
