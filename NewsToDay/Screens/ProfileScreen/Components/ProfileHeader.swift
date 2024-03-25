//
//  ProfileHeader.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI
import DS

struct ProfileHeader: View {
    
    private enum Drawing {
        static let frameImage: CGFloat = 72
        static let spacing: CGFloat = 5
    }
        var body: some View {
                HStack {
                    Text(UserModel.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(DS.Colors.Theme.buttonText)
                        .frame(width: Drawing.frameImage, height: Drawing.frameImage)
                        .background(DS.Colors.Theme.buttonBackground)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: Drawing.spacing) {
                        Text(UserModel.MOCK_USER.userName)
                            .font(.headline)
                        
                        Text(UserModel.MOCK_USER.email)
                            .font(.subheadline)
                            .foregroundColor(DS.Colors.Theme.buttonText)
                    }
                    .padding()
                }
            }
    }

#Preview {
    ProfileHeader()
}
