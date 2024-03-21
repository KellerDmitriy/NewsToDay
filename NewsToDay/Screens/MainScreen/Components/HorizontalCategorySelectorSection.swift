//
//  HorizontalCategory.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import DS

struct HorizontalCategorySelectorSection: View {
    
    let sections: [Categories]
    @State var selected: Categories
    @Namespace private var namespace

    #warning("Better to use enum.")
    private struct Drawing {
        static let spacing: CGFloat = 16
        static let verticalPadding: CGFloat = 8
        static let horizontalPadding: CGFloat = 16
        static let cornerRadius: CGFloat = 16
        static let selectedCornerRadius: CGFloat = 25.0
        static let selectedBackgroundColorOpacity: Double = 0.1
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Drawing.spacing) {
                ForEach(sections, id: \.self) { section in
                    Text(section.rawValue)
                        .foregroundStyle(
                            selected == section 
                            ? DS.Colors.Theme.whiteAccent
                            : DS.Colors.Theme.secondaryText
                        )
                        .padding(.vertical, Drawing.verticalPadding)
                        .padding(.horizontal, Drawing.horizontalPadding)
                        .cornerRadius(Drawing.cornerRadius)
                        .background(computeBackground(for: section))
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selected = section
                            }
                        }
                }
            }
            .padding(.horizontal)
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
    HorizontalCategorySelectorSection(
        sections: Categories.allCases,
        selected: .business
    )
}
