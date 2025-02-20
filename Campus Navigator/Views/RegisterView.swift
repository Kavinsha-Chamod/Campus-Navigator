//
//  RegisterView.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmEmail: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.792, green: 0.941, blue: 0.973)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Register")
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("Enter your personal information.")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView{
                        VStack(spacing: 6) {
                            TextInputView(
                                title: "Name",
                                placeholder: "Enter your name",
                                text: $name
                            )
                            
                            TextInputView(
                                title: "Campus Username",
                                placeholder: "Enter your campus provided username",
                                text: $username)
                            
                            TextInputView(
                                title: "Campus Email",
                                placeholder: "Enter your campus provided email",
                                text: $email
                            )
                            
                            TextInputView(
                                title: "Password",
                                placeholder: "Enter your password",
                                text: $password,
                                isSecure: true
                            )
                            TextInputView(
                                title: "Confirm Password",
                                placeholder: "Confirm password",
                                text: $confirmPassword,
                                isSecure: true
                            )
                            
                            // REGISTER BUTTON
                            ButtonView(
                                title: "REGISTER",
                                backgroundColor: Color(red: 2/255, green: 62/255, blue: 138/255),
                                foregroundColor: .white,
                                borderColor: Color(red: 2/255, green: 62/255, blue: 138/255),
                                action: {
                                    
                                }
                            )
                            .padding(.top, 30)
                            HStack {
                                Text("Have an account?")
                                    .foregroundColor(.black)

                                NavigationLink(destination: LoginView()) {
                                    Text("Login")
                                        .foregroundColor(.blue)
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(.top, 20)
                        }
                        .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
