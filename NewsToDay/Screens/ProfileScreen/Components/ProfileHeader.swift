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
    
    var userName: String
    var email: String
    var avatar: UIImage
    
        var body: some View {
                HStack {
                    Image(uiImage: avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Drawing.frameImage)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: Drawing.spacing) {
                        Text(userName)
                            .font(.headline)
                        
                        Text(email)
                            .font(.subheadline)
                            .foregroundColor(DS.Colors.Theme.secondaryText)
                    }
                    .padding()
                }
            }
    }

#Preview {
    ProfileHeader(userName: "Dev P", email: "dev@gmail.com", avatar: UIImage(named: "avatar")!)
}
