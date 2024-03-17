//
//  MainScreenDetailView.swift
//  NewsToDay
//
//  Created by dsm 5e on 17.03.2024.
//

import SwiftUI

struct News {
    let categories: String
    let title: String
    let author: String
    let description: String
    let image: String
}

struct MainScreenDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let item: News = News(categories: "Politics", title: "The latest situation in the presidential election", author: "John Doe", description: "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.", image: "image")
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Image(item.image)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.height / 2.8)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.forward.fill")
                                .foregroundColor(.white)
                        })
                    }
                    .padding()
                    
                    HStack {
                        Text(item.categories)
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.indigo)
                            .cornerRadius(16)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text(item.title)
                            .font(.title)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.author)
                                .foregroundStyle(.white)
                            
                            Text("Author")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            
            ScrollView {
                HStack {
                    Text("Results")
                        .bold()
                    Spacer()
                }
                .padding()

                Text(item.description)
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
        MainScreenDetailView()
    }
}
