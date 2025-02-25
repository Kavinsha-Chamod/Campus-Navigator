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
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Top Section (Profile + Notification Icon)
                    HStack {
                        HStack(spacing: 10) {
                            Image("profile")
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
                        .background(Color.purple.opacity(0.05))
                        .cornerRadius(12)
                        
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
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hides the back button
    }
}


#Preview {
    DashboardView(user: User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"))
}
