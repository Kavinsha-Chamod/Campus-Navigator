//
//  MainTabView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-24.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct MainTabView: View {
    @State private var selectedTab = 0
    var user: User

    var body: some View {
        NavigationStack {
            ZStack {
                // Add a blur effect to mimic polished UI
                BlurView(style: .systemUltraThinMaterial)
                    .ignoresSafeArea()

                TabView(selection: $selectedTab) {
                    DashboardView(user: user)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)

                    MarkAttendanceView()
                        .tabItem {
                            Image(systemName: "qrcode.viewfinder")
                            Text("Mark Attendance")
                        }
                        .tag(1)

                    PrivateChatView()
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                            Text("Chat")
                        }
                        .tag(2)

                    AccountView()
                        .tabItem {
                            Image(systemName: "person.crop.circle.fill")
                            Text("Account")
                        }
                        .tag(3)
                }
                .accentColor(.blue)
            }
        }
    }
}

#Preview {
    MainTabView(user: User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"))
}
