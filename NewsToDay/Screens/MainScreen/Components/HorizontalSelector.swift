//
//  HorizontalCategory.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct HorizontalSelector<V: View, T: Identifiable>: View {
    let collection: [T]
    let spacing: CGFloat
    let element: (T) -> V

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(collection, content: element)
            }
            .padding(.horizontal)
        }
    }
    
    init(
        _ collection: [T],
        spacing: CGFloat = 16,
        element: @escaping (T) -> V
    ) {
        self.collection = collection
        self.spacing = spacing
        self.element = element
    }
}

#Preview {
    HorizontalSelector(
        Categories.allCases,
        element: { _ in EmptyView() }
    )
}
