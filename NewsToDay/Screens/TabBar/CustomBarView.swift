//
//  CustomBarView.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomBarView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
                
            MainContentScreen().tag(1)
            Text("Categories").tag(2)
            Text("Bookmarks").tag(3)
            Text("Profile").tag(4)
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(tabSelection: $tabSelection)
        }
    }
}

#Preview {
    CustomBarView()
}
