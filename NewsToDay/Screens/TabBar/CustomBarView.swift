//
//  CustomBarView.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomBarView: View {
    
    @EnvironmentObject var mainViewModel: MainScreenVM
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
                
            NavigationView{
                MainContentScreen()
                    .environmentObject(mainViewModel)
                    .tag(1)
            }
            .tabItem {
                Label("house", systemImage: "house")
            }
            
            NavigationView {
                CategoriesView(mode: .screen)
                    .environmentObject(mainViewModel)
                    .tag(2)
            }
            .tabItem {
                Label("house", systemImage: "squareshape.split.2x2")
            }
            
            Text("Bookmarks")
                .tag(3)
                .tabItem {
                    Label("house", systemImage: "bookmark")
                }

            NavigationView {
                ProfileScreen()
                .tag(4)
            }
                .tabItem {
                    Label("profile", systemImage: "person")
                }
        }
//        .overlay(alignment: .bottom) {
//            CustomTabBar(tabSelection: $tabSelection)
//        }
    }
}

#Preview {
    CustomBarView()
        .environmentObject(MainScreenVM())
}
