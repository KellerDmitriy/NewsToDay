//
//  CategoriesView.swift
//  NewsToDay
//
//  Created by dsm 5e on 20.03.2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @AppStorage("isSelectedCategory") var isSelectedCategory = false
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    
    @EnvironmentObject var viewModel: MainScreenVM
    @State var mode: Mode = .onboarding
    
    enum Drawing {
        static let imageWidth: CGFloat = 0.7
        static let imageHeight: CGFloat = 0.4
        static let imageCornerRadius: CGFloat = 12
        static let dotSize: CGFloat = 10
        static let rectSize: CGFloat = 20
        static let dotSpacing: CGFloat = 10
        static let buttonCornerRadius: CGFloat = 15
        static let buttonPadding: CGFloat = 16
        static let indigoAccentColor = Color.indigo
        static let grayColor = Color.gray
    }
    
    enum Mode {
        case onboarding
        case screen
    }
    
    var body: some View {
        if mode == .onboarding {
            VStack {
                ScrollView {
                    HStack {
                        Text("Select some of your favorite topics to let us suggest better news for you.".localized(language))
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    Spacer()
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2)) {
                        ForEach(Categories.allCases) { category in
                            Button(action: {
                                if viewModel.categories.contains(category) {
                                    viewModel.categories.remove(category)
                                } else {
                                    viewModel.categories.insert(category)
                                }
                            }) {
                                HStack(spacing: 8) {
                                    Spacer()
                                    Text(category.image)
                                    Text(category.rawValue.localized(language))
                                    Spacer()
                                }
                                .foregroundStyle(viewModel.categories.contains(category) ? Color.white : Color.black.opacity(0.6))
                                .font(.headline.bold())
                                .padding(.vertical, 20)
                                .background(viewModel.categories.contains(category) ? Color.indigo : Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    isSelectedCategory.toggle()
                }, label: {
                    Text("Choose".localized(language))
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Drawing.indigoAccentColor)
                        .cornerRadius(Drawing.buttonCornerRadius)
                        .padding(Drawing.buttonPadding)
                })
            }
        } else {
            VStack {
                ScrollView {
                    HStack {
                        Text("Thousands of articles in each category".localized(language))
                    }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    Spacer()
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2)) {
                        ForEach(Categories.allCases) { category in
                            Button(action: {
                                if viewModel.categories.contains(category) {
                                    viewModel.categories.remove(category)
                                } else {
                                    viewModel.categories.insert(category)
                                }
                            }) {
                                HStack(spacing: 8) {
                                    Spacer()
                                    Text(category.image)
                                    Text(category.rawValue.localized(language))
                                    Spacer()
                                }
                                .foregroundStyle(viewModel.categories.contains(category) ? Color.white : Color.black.opacity(0.6))
                                .font(.headline.bold())
                                .padding(.vertical, 20)
                                .background(viewModel.categories.contains(category) ? Color.indigo : Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("Categories".localized(language))
        }
    }
}

#Preview {
    NavigationView {
        CategoriesView(mode: .onboarding)
            .environmentObject(MainScreenVM())
    }
}
