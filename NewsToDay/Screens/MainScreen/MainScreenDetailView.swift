//
//  MainScreenDetailView.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI
import DS
import NetworkManager

struct News {
    let categories: String
    let title: String
    let author: String
    let description: String
    let image: String
}

struct MainScreenDetailView: View {
    
    @Environment(\.dismiss) var dismiss
//    @StateObject private var imageLoader = ImageLoader()
    
    let item: NewsResults
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                AsyncImageView(item.imageUrl)
                    .ignoresSafeArea()
//                AsyncImageView(url: URL(string: item.imageUrl ?? ""), placeholderImage: Image(.image))
//                    .ignoresSafeArea()
//                    .frame(height: UIScreen.main.bounds.height / 2.8)
                
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.forward.fill")
                                .foregroundColor(DS.Colors.Theme.whiteAccent)
                        })
                    }
                    .padding()
                    
                    HStack {
                        Text("Default")
                            .font(DS.Fonts.Inter16.semiBold600)
                            .foregroundStyle(DS.Colors.Theme.whiteAccent)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(DS.Colors.Theme.indigoAccent)
                            .cornerRadius(16)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text(item.title ?? "")
                            .font(DS.Fonts.Inter20.bold700)
                            .foregroundStyle(DS.Colors.Theme.whiteAccent)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.creator?.joined(separator: ", ") ?? "")
                                .font(DS.Fonts.Inter16.semiBold600)
                                .foregroundStyle(DS.Colors.Theme.whiteAccent)
                            
                            Text("Author")
                                .font(DS.Fonts.Inter14.regular400)
                                .foregroundStyle(DS.Colors.Theme.grayLight)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            
            ScrollView {
                HStack {
                    Text("Results")
                        .font(DS.Fonts.Inter16.semiBold600)
                    Spacer()
                }
                .padding()

                Text(item.description ?? "")
                    .foregroundStyle(DS.Colors.Theme.secondaryText)
                    .font(DS.Fonts.Inter16.regular400)
                    .padding(.horizontal)
            }
            
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                })
            }
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationView {
        MainScreenDetailView(item: NewsResults.preview)
    }
}
