//
//  CustomBarView.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 18.03.2024.
//

import SwiftUI

struct CustomBarView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        VStack {
            // Основное содержимое ваших вкладок
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
            // Кастомный таббар
            CustomTabBar(tabSelection: $tabSelection)
                .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom) // Игнорировать SafeArea внизу
    }
}


#Preview {
    CustomBarView()
}
