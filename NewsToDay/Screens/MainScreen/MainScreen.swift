//
//  MainScreen.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject var vm = MainScreenVM()
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Text("Discover things of this world")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                SearchBar(text: $vm.searchText)
                
                HorizontalCategorySelectorSection(vm: vm)
                
                HorizontalCategoryCardSection(vm: vm)
                
                SectionTitle(sectionTitle: "Recomended for you", buttonTitle: "See all", item: EmptyView())
                
                VerticalRecomendedSection()
            }
        }
        .navigationTitle("Browse")
    }
}

#Preview {
    NavigationView {
        MainScreen()
    }
}
