//
//  LoginView.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color(red: 0.792, green: 0.941, blue: 0.973).edgesIgnoringSafeArea(.all)
            VStack{
                Image("loginScreen")
                    .resizable()
                    .frame(height: 180)
                    .frame(maxWidth: 250)
                
                VStack{
                    Text("Login")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Login to continue using the app.")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                }.padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    TextInputView(
                        title: "Username",
                        placeholder: "Enter your username",
                        text: $username
                    )
                    TextInputView(
                        title: "Password",
                        placeholder: "Enter password",
                        text: $password
                    )
                    Text("Forgot Password ?")
                        .padding(.leading, 180)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
