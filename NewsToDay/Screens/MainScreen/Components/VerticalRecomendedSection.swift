//
//  VerticalRecomendedSection.swift
//  NewsToDay
//
//  Created by dsm 5e on 18.03.2024.
//

import SwiftUI

struct VerticalRecomendedSection: View {
    private struct Drawing {
        static let spacing: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let imageWidth: CGFloat = 96
        static let imageHeight: CGFloat = 96
        static let headlineFontSize: CGFloat = 18
        static let headlineFontWeight: Font.Weight = .light
        static let padding: CGFloat = 16
    }

    var body: some View {
        ScrollView {
            HStack(spacing: Drawing.spacing) {
                RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                    .frame(width: Drawing.imageWidth, height: Drawing.imageHeight)
                VStack(alignment: .leading, spacing: Drawing.spacing) {
                    Text("UI/UX Design")
                        .font(.headline.weight(Drawing.headlineFontWeight))

                    Text("A Simple Trick For Creating Color Palettes Quickly")
                        .font(.headline)
                }
                Spacer()
            }
            .padding(.horizontal, Drawing.padding)

            HStack(spacing: Drawing.spacing) {
                RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                    .frame(width: Drawing.imageWidth, height: Drawing.imageHeight)
                VStack(alignment: .leading, spacing: Drawing.spacing) {
                    Text("UI/UX Design")
                        .font(.headline.weight(Drawing.headlineFontWeight))

                    Text("A Simple Trick For Creating Color Palettes Quickly")
                        .font(.headline)
                }
                Spacer()
            }
            .padding(.horizontal, Drawing.padding)

            HStack(spacing: Drawing.spacing) {
                RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                    .frame(width: Drawing.imageWidth, height: Drawing.imageHeight)
                VStack(alignment: .leading, spacing: Drawing.spacing) {
                    Text("UI/UX Design")
                        .font(.headline.weight(Drawing.headlineFontWeight))

                    Text("A Simple Trick For Creating Color Palettes Quickly")
                        .font(.headline)
                }
                Spacer()
            }
            .padding(.horizontal, Drawing.padding)
        }
    }
}

#Preview {
    VerticalRecomendedSection()
}
