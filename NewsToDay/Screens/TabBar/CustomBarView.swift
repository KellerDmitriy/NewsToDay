//
//  CustomBarView.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomBarView: View {
    
    @EnvironmentObject var mainViewModel: MainScreenVM
    
    @State private var tabSelection = 1

    var body: some View {
        VStack {
            switch tabSelection {
            case 1:
                NavigationView {
                    MainContentScreen()
                }
            case 2:
                NavigationView {
                    CategoriesView(mode: .screen)
                }
            case 3:
                NavigationView {
                    Text("Bookmarks")
                }
            case 4:
                NavigationView {
                    ProfileScreen()
                }
            default:
                NavigationView {
                    MainContentScreen()
                }
            }
            CustomTabBar(tabSelection: $tabSelection)
                .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    CustomBarView()
        .environmentObject(MainScreenVM())
}
