//
//  CategoryCell.swift
//  NewsToDay
//
//  Created by Илья Шаповалов on 23.03.2024.
//

import SwiftUI
import DS

struct CategoryCell: View {
    private enum Drawing {
        static let verticalPadding: CGFloat = 8
        static let horizontalPadding: CGFloat = 16
        static let cornerRadius: CGFloat = 16
        static let selectedCornerRadius: CGFloat = 25.0
    }
    
    let category: Categories
    @Binding var selected: Categories
    @Namespace private var namespace
    
    var body: some View {
        Text(category.rawValue)
            .foregroundStyle(
                selected == category
                ? DS.Colors.Theme.whiteAccent
                : DS.Colors.Theme.secondaryText
            )
            .padding(.vertical, Drawing.verticalPadding)
            .padding(.horizontal, Drawing.horizontalPadding)
            .cornerRadius(Drawing.cornerRadius)
            .background(computeBackground(for: category))
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selected = category
                }
            }
    }
    
    @ViewBuilder
    private func computeBackground(for section: Categories) -> some View {
        if selected == section {
            RoundedRectangle(cornerRadius: Drawing.selectedCornerRadius)
                .fill(
                    selected == section
                    ? DS.Colors.Theme.indigoAccent
                    : DS.Colors.Theme.secondaryText
                )
                .matchedGeometryEffect(id: "section", in: namespace)
        }
    }

}

#Preview {
    VStack {
        CategoryCell(category: .food, selected: .constant(.food))
        CategoryCell(category: .food, selected: .constant(.health))
    }
}
