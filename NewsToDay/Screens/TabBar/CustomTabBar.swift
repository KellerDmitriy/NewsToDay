//
//  CustomTabBar.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI
import DS

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
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: tabBarCorner)
                        .stroke(DS.Colors.Theme.grayLight, lineWidth: 1)
                        .mask(
                            RoundedRectangle(cornerRadius: tabBarCorner)
                                .frame(height: tabBarHeight)
                                .offset(y: -1)
                        )
                )
            
            HStack {
                ForEach(tabBarItems, id: \.self) { item in
                    createTabBarButton(imageName: item)
                }
            }
            .frame(height: tabBarHeight )
        }
    }
    
    // MARK: - Private Methods
    private func createTabBarButton(imageName: String) -> some View {
        let index = tabBarItems.firstIndex(of: imageName) ?? 0
        let isSelected = index + 1 == tabSelection
        
        return Button {
            tabSelection = index + 1 
        } label: {
            VStack() {
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: tabBarTitleWH, height: tabBarTitleWH)
                    .padding(tabBarTitlePadding)
                    .offset(y: -tabBarTitleOffset)
            }
            .foregroundColor(isSelected
                             ? DS.Colors.Theme.indigoAccent
                             : DS.Colors.Theme.grayLight)
        }
    }
}

#Preview {
    CustomTabBar(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
