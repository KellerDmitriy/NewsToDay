//
//  OnboardingView.swift
//  NewsToDay
//
//  Created by dsm 5e on 18.03.2024.
//

import SwiftUI

struct OnboardingPage {
    var title: String
    var description: String
    var image: String
    
    static let pages: [OnboardingPage] = [
        OnboardingPage(title: "Будьте в курсе",
                       description: "Получайте последние новости и обновления со всего мира. ",
                       image: "onboarding1"),
        OnboardingPage(title: "Лента по вашим интересам",
                       description: "Выберите темы, которые вас интересуют, и мы создадим персонализированную ленту новостей только для вас. ",
                       image: "onboarding2"),
        OnboardingPage(title: "Сохраняйте и делитесь",
                       description: "Сохраняйте статьи для чтения позже и делитесь любимыми историями с друзьями. ",
                       image: "onboarding3"),
    ]
}


struct OnboardingView: View {
    
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
    
    @Binding var isOnboarding: Bool
    @State private var currentPage = 0
    
    let bounds = UIScreen.main.bounds
    let lastPage = OnboardingPage.pages.count - 1
    let page = OnboardingPage.pages
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    self.currentPage = lastPage
                } label: {
                    Text("Пропустить")
                        .foregroundColor(Drawing.grayColor)
                }
                .padding()
            }
            
            TabView(selection: $currentPage) {
                ForEach(0..<page.count, id: \.self) { index in
                    VStack {
                        Image(page[index].image)
                            .resizable()
                            .frame(width: bounds.width * Drawing.imageWidth, height: bounds.height * Drawing.imageHeight)
                            .cornerRadius(Drawing.imageCornerRadius)
                        Spacer()
                        Text(page[index].title)
                            .font(.title)
                        Text(page[index].description)
                            .font(.title3.weight(.light))
                            .foregroundStyle(Drawing.grayColor)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<page.count, id: \.self) { index in
                    if index == currentPage {
                        Rectangle()
                            .frame(width: Drawing.rectSize, height: Drawing.dotSize)
                            .cornerRadius(Drawing.dotSize / 2)
                            .foregroundColor(Drawing.indigoAccentColor)
                    } else {
                        Circle()
                            .frame(width: Drawing.dotSize, height: Drawing.dotSize)
                            .foregroundColor(Drawing.grayColor)
                    }
                }
            }
            .frame(height: Drawing.dotSize)
            .padding(Drawing.dotSpacing)
            
            Button(action: {
                if self.currentPage < lastPage {
                    self.currentPage += 1
                } else {
                    isOnboarding.toggle()
                }
            }, label: {
                Text(currentPage < lastPage ? "Далее" : "Открыть")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Drawing.indigoAccentColor)
                    .cornerRadius(Drawing.buttonCornerRadius)
                    .padding(Drawing.buttonPadding)
            })
        }
        .animation(.easeInOut, value: currentPage)
    }
}

#Preview {
    OnboardingView(isOnboarding: .constant(false))
}
