//
//  ErrorScreen.swift
//  NewsToDay
//
//  Created by dsm 5e on 23.03.2024.
//

import SwiftUI

struct ErrorView: View {
    
    let error: Error
    let action: () -> ()
    
    var body: some View {
        ZStack {
            MainScreenWithShimmer()
                .disabled(true)
            
            VStack(spacing: 20) {
                Text("Error\(error.localizedDescription)")
                Button("Reload") {
                    action()
                }
            }
            .padding()
            .background(Material.regular)
            .cornerRadius(15)
        }
    }
}
