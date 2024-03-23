//
//  SectionTitle.swift
//  NewsToDay
//
//  Created by dsm 5e on 18.03.2024.
//

import SwiftUI
import DS

struct SectionTitle<NavigationItem:View>: View {
    
    var sectionTitle: String
    var buttonTitle: String
    var item: NavigationItem
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(DS.Fonts.Inter20.semiBold600)
            Spacer()
            NavigationLink {
                item
            } label: {
                Text(buttonTitle)
                    .font(DS.Fonts.Inter14.medium500)
                    .foregroundStyle(DS.Colors.Theme.secondaryText)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    SectionTitle(sectionTitle: "test", buttonTitle: "fix", item: EmptyView())
}
