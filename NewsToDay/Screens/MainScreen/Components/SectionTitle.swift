//
//  SectionTitle.swift
//  NewsToDay
//
//  Created by dsm 5e on 18.03.2024.
//

import SwiftUI

struct SectionTitle<NavigationItem:View>: View {

    var sectionTitle: String
    var buttonTitle: String
    var item: NavigationItem
    
    var body: some View {
        HStack {
            Text(sectionTitle.localized)
                .font(.headline).bold()
            Spacer()
            NavigationLink {
                item
            } label: {
                Text(buttonTitle.localized)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    SectionTitle(sectionTitle: "test", buttonTitle: "fix", item: EmptyView())
}
