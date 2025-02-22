//
//  DashboardView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-18.
//

import SwiftUI

struct DashboardView: View {
    var user: User
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(red: 0.792, green: 0.941, blue: 0.973)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    HStack(spacing: 10) {
                        Image("userIcon")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Text("Hello, ")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.black) +
                                Text(user.name)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Text(user.username)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(10)
                    .background(Color(red: 153/255, green: 0/255, blue: 239/255, opacity: 0.0549))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Alert icon tapped!")
                    }) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                ScrollView {
                    
                    EventSlideshowView()
                        .padding(.top, 20)
                    
                    NavigationTilesView()
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DashboardView(user: User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"))
}
