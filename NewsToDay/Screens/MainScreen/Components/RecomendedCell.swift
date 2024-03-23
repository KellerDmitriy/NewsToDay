//
//  RecomendedCell.swift
//  NewsToDay
//
//  Created by dsm 5e on 23.03.2024.
//

import SwiftUI
import DS
import NetworkManager

struct RecomendedCell: View {
    
    private struct Drawing {
        static let spacing: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let imageWidth: CGFloat = 96
        static let height: CGFloat = 96
        static let headlineFontSize: CGFloat = 18
        static let headlineFontWeight: Font.Weight = .light
        static let padding: CGFloat = 16
    }
    
    let item: NewsResults
    
    var body: some View {
        HStack(spacing: Drawing.spacing) {
            RoundedRectangle(cornerRadius: Drawing.cornerRadius)
                .foregroundColor(DS.Colors.Theme.indigoAccent)
                .frame(width: Drawing.imageWidth)
            
            VStack(alignment: .leading, spacing: Drawing.spacing) {
                Text(item.author ?? "default")
                    .foregroundStyle(DS.Colors.Theme.grayLight)
                    .font(.headline.weight(Drawing.headlineFontWeight))
                
                Text(item.title ?? "default")
                    .foregroundStyle(DS.Colors.Theme.primaryText)
                    .font(DS.Fonts.Inter16.semiBold600)
            }
            Spacer()
        }
        .padding(.horizontal, Drawing.padding)
        .frame(maxWidth: .infinity)
        .frame(height: Drawing.height)
    }
}

#Preview {
    RecomendedCell(item: NewsResults.preview)
}
