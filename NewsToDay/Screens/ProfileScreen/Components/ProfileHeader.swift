//
//  ProfileHeader.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

import SwiftUI

struct ProfileHeader: View {
    
    private enum Drawing {
        static let foregraundColor = "7C82A1"
        static let frameImage: CGFloat = 72
        static let spacing: CGFloat = 5
    }
    
    var userName: String
    var email: String
    var imageName: String = "avatar"
    
        var body: some View {
                HStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Drawing.frameImage)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: Drawing.spacing) {
                        Text(userName)
                            .font(.headline)
                        
                        Text(email)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: Drawing.foregraundColor))
                    }
                    .padding()
                }
            }
    }

#Preview {
    ProfileHeader(userName: "Dev P", email: "dev@gmail.com")
}
