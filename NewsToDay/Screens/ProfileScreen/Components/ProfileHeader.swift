//
//  ProfileHeader.swift
//  NewsToDay
//
//  Created by Максим Самороковский on 20.03.2024.
//

//import SwiftUI
//
//struct ProfileHeader: View {
//    
//    private enum Drawing {
//        static let foregraundColor = "7C82A1"
//        static let frameImage: CGFloat = 72
//        static let spacing: CGFloat = 5
//    }
//    
//    var userName: String
//    var email: String
//    var imageName: String = "avatar"
//    
//        var body: some View {
//                HStack {
//                    Image(imageName)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: Drawing.frameImage)
//                        .clipShape(.circle)
//                    
//                    VStack(alignment: .leading, spacing: Drawing.spacing) {
//                        Text(userName)
//                            .font(.headline)
//                        
//                        Text(email)
//                            .font(.subheadline)
//                            .foregroundColor(Color(hex: Drawing.foregraundColor))
//                    }
//                    .padding()
//                }
//            }
//    }
//
//#Preview {
//    ProfileHeader(userName: "Dev P", email: "dev@gmail.com")
//}

import DS
import SwiftUI

struct ProfileHeader: View {
    
    private enum Drawing {
        static let backgroundColor = DS.Colors.Theme.buttonBackground
        static let foregraundColor = DS.Colors.Theme.buttonText
        static let frameImage: CGFloat = 72
        static let spacing: CGFloat = 5
    }
        var body: some View {
                HStack {
                    Text(UserVM.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Drawing.foregraundColor)
                        .frame(width: Drawing.frameImage, height: Drawing.frameImage)
                        .background(Drawing.backgroundColor)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: Drawing.spacing) {
                        Text(UserVM.MOCK_USER.userName)
                            .font(.headline)
                        
                        Text(UserVM.MOCK_USER.email)
                            .font(.subheadline)
                            .foregroundColor(Drawing.foregraundColor)
                    }
                    .padding()
                }
            }
    }

#Preview {
    ProfileHeader()
}
