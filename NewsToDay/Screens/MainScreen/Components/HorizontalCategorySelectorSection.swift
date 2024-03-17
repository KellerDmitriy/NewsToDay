//
//  HorizontalCategory.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct HorizontalCategorySelectorSection: View {
    
    @ObservedObject var vm: MainScreenVM
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
                ForEach(vm.sections, id: \.self) { section in

                    Text(section)
                        .foregroundStyle(vm.selectedSection == section ? Color.white : Color.gray)
                        .padding(.vertical, Drawing.verticalPadding)
                        .padding(.horizontal, Drawing.horizontalPadding)
                        .cornerRadius(Drawing.cornerRadius)
                        .background(content: {
                            if vm.selectedSection == section  {
                                RoundedRectangle(cornerRadius: Drawing.selectedCornerRadius)
                                    .fill(vm.selectedSection == section ? Color.indigo : Color.indigo.opacity(Drawing.selectedBackgroundColorOpacity))
                                    .matchedGeometryEffect(id: "section", in: namespace)
                            }
                        })
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.vm.selectedSection = section
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HorizontalCategorySelectorSection(vm: MainScreenVM())
}
