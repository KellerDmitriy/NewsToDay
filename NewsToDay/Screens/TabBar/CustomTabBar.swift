//
//  CustomTabBar.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomTabBar: View {
    
    // MARK: - Constants
    private let tabBarHeight: CGFloat = 96
    private let tabBarCorner: CGFloat = 12
    private let tabBarTitlePadding: CGFloat = 28
    private let tabBarTitleOffset: CGFloat = 12
    private let tabBarTitleWH: CGFloat = 24
    
    // MARK: - Properties
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    let tabBarItems: [(String)] = ["house", "squareshape.split.2x2", "bookmark", "person"]
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: tabBarCorner)
                .frame(height: tabBarHeight)
                .foregroundColor(Color(.secondarySystemBackground))
                .opacity(0.5)
            HStack {
                ForEach(tabBarItems, id: \.self) { item in
                    createTabBarButton(imageName: item)
                }
            }
            .frame(height: tabBarHeight)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Private Methods
    private func createTabBarButton(imageName: String) -> some View {
        let index = tabBarItems.firstIndex(of: imageName) ?? 0
        let isSelected = index + 1 == tabSelection
        
        return Button {
            tabSelection = index + 1 
        } label: {
            VStack() {
                Spacer()
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: tabBarTitleWH, height: tabBarTitleWH)
                    .padding(tabBarTitlePadding)
                    .offset(y: -tabBarTitleOffset)
            }
            .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

#Preview {
    CustomTabBar(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
