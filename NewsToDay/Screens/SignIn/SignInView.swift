//
//  SignInView.swift
//  NewsToDay
//
//  Created by Максим Нурутдинов on 19.03.2024.
//

import SwiftUI

struct SignInView : View {
    
    @State var user = ""
    @State var pass = ""
    
    var body : some View {
        VStack {
            Text("Welcome Back👋")
                .fontWeight(.heavy)
                .font(.title)
                .padding([.top, .leading], 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("I am happy to see you again. You can continue where you left off by logging in")
                .foregroundColor(Color.gray.opacity(0.5))
                .padding([.top, .leading], 10)
            VStack (alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {

                        
                        HStack {
                            
                            TextField("Email Adress", text: $user).padding()
                                .frame(width: 336, height: 56)
                                .background(Color.gray)
                                .clipShape(Rectangle()).cornerRadius(10)
                            
                            if user != ""{
                                
                                Image("check").foregroundColor(Color.init(.label))
                            }
                            
                        }
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading) {
                        
                        SecureField("Password", text: $pass).padding()
                            .frame(width: 336, height: 56)
                            .background(Color.gray)
                            .clipShape(Rectangle()).cornerRadius(10)
                        
                    }
                    
                }.padding(.horizontal, 6)
                
            }.padding()
            
            VStack{
                
                Button(action: {
                    
                }) {
                    
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120).padding()
                        .background(Color.blue)
                    
                    
                    
                }.background(Color("color"))
                    .clipShape(Rectangle()).cornerRadius(10)
                    .padding(.top, 45)
                
                
                Spacer()
                
                HStack(spacing: 8){
                    
                    Text("Don't Have An Account ?").foregroundColor(Color.gray.opacity(0.5))
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Sign Up")
                        
                    }.foregroundColor(.black)
                    
                }.padding(.top, 25)
            }
        }
    }
}

#Preview {
    SignInView()
}
