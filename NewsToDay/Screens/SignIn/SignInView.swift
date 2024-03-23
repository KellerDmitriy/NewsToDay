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
                .foregroundColor(Color(hex: "#7C82A1"))
                .padding([.top, .leading], 10)
            VStack (alignment: .leading) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                                .padding(.trailing, 5)
                            
                            Spacer()
                            
                            TextField("Email Adress", text: $user)
                                .padding()
                                .frame(height: 56)
                                .background(Color(hex: "#F3F4F6"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            if user != ""{
                                Image("check").foregroundColor(Color.init(.label))
                            }
                        }
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lock.rectangle")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                                .padding(.trailing, 5)
                            
                            Spacer()
                            
                            SecureField("Password", text: $pass)
                                .padding()
                                .frame(height: 56)
                                .background(Color(hex: "#F3F4F6"))
                                .clipShape(Rectangle()).cornerRadius(10)
                        }
                    }
                    
                }.padding(.horizontal, 6)
                
            }.padding()
            
            VStack{
                
                Button(action: {
                    
                }) {
                    
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120).padding()
                        .background(Color(hex: "#475AD7"))
                }
                .background(Color("color"))
                .clipShape(Rectangle()).cornerRadius(10)
                .padding(.top, 45)
                
                Spacer()
                
                HStack(spacing: 8){
                    Text("Don't Have An Account ?")
                        .foregroundColor(Color(hex: "#333647"))
                        
                    Button(action: {
        
                    }) {
                        Text("Sign Up")
                    }
                    .foregroundColor(.black)
                }.padding(.top, 25)
            }
        }
    }
}

#Preview {
    SignInView()
}
