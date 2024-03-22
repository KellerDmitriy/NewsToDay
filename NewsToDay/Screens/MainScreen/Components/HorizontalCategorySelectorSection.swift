//
//  HorizontalCategory.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct HorizontalCategorySelectorSection: View {
    let sections: [Categories]
    @Binding var selected: Categories
//    @ObservedObject var vm: MainScreenVM
    @Namespace private var namespace

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

                    Text(section.rawValue.localized)
                        .foregroundStyle(selected == section ? Color.white : Color.gray)
                        .padding(.vertical, Drawing.verticalPadding)
                        .padding(.horizontal, Drawing.horizontalPadding)
                        .cornerRadius(Drawing.cornerRadius)
                        .background(content: {
                            if selected == section {
                                RoundedRectangle(cornerRadius: Drawing.selectedCornerRadius)
                                    .fill(selected == section
                                          ? Color.indigo
                                          : Color.indigo.opacity(Drawing.selectedBackgroundColorOpacity))
                                    .matchedGeometryEffect(id: "section", in: namespace)
                            }
                        })
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
}

#Preview {
    HorizontalCategorySelectorSection(
        sections: Categories.allCases,
        selected: .constant(.business)
    )
}
