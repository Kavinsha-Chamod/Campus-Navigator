//
//  MainTabView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            DashboardView(user: User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"))
                .tabItem {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Home")
                }
                .tag(0)
            
            AvailabilityView()
                .tabItem {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Availability")
                }
                .tag(1)
            
            MarkAttendanceView()
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Mark Attendance")
                }
                .tag(2)
            
            PrivateChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Chat")
                }
                .tag(3)
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Account")
                }
                .tag(4)
        }
        .accentColor(.blue)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MainTabView()
}
