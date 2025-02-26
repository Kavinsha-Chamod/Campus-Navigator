//
//  DashboardView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-18.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let time: String
}

struct DashboardView: View {
    var user: User
    @State private var showAlerts = false
    
    let notifications: [Notification] = [
        Notification(title: "Lecture Hall Changed", message: "iOS lecture changed to hall 14.", time: "2 min ago"),
        Notification(title: "Reminder", message: "Don't forget to submit your assignment.", time: "10 min ago"),
        Notification(title: "New friend request", message: "Amali Perera has requested.", time: "30 min ago"),
        Notification(title: "New Event Added", message: "IEEE added a new event.", time: "1 hour ago")
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Color.white
                        .edgesIgnoringSafeArea(.all)

                    VStack {
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

                            // Alert Button
                            Button(action: {
                                withAnimation {
                                    showAlerts.toggle()
                                }
                            }) {
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.black)
                            }
                            .background(GeometryReader { geometry in
                                Color.clear.preference(key: AlertPositionKey.self, value: geometry.frame(in: .global))
                            })
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

            if showAlerts {
                VStack(alignment: .leading, spacing: 10) {
                    Divider()

                    VStack(spacing: 10) {
                        ForEach(Array(notifications.enumerated()), id: \.element.id) { index, notification in
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(notification.title)
                                        .font(.headline)
                                        .foregroundColor(.black)

                                    Spacer()

                                    Text(notification.time)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                Text(notification.message)
                                    .font(.body)
                                    .foregroundColor(.gray)

                                Divider()
                            }
                            .padding(.horizontal)
                            .padding(.top, index == 0 ? 10 : 0)                        }
                    }
                    .padding(.bottom, 10)
                }
                .background(Color.white)
                .frame(maxWidth: 360)
                .cornerRadius(12)
                .shadow(radius: 10)
                .padding(.trailing, 20)
                .offset(y: 50)
                .zIndex(1)
            }

            if showAlerts {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showAlerts = false
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AlertPositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

#Preview {
    DashboardView(user: User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"))
}
