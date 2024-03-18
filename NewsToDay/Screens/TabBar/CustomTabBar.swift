//
//  CustomTabBar.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
    ("house", "Home"),
    ("squareshape.split.2x2", "Categories"),
    ("bookmark", "Bookmarks"),
    ("person", "Profile"),
    ]
    
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
                .opacity(0.8)
            
            HStack {
                ForEach(0..<4) { index in
                    Button {
                       tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                                .padding(28)
                                .offset(y: -10)
                                
//                            Text(tabBarItems[index].title)
//                                .offset(y: -10)
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .green)
                    }
                    
                }
            }
            .frame(height: 80)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabBar(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
