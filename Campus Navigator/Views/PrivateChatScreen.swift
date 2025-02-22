//
//  PrivateChatScreen.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-20.
//
import SwiftUI

struct PrivateChatScreen: View {
    @State private var searchText: String = ""
    @State private var showFriendRequests = false
    
    // Sample Friend Requests
    @State private var friendRequests = [
        "Janith Perera",
        "Rayan Fernando",
        "Rowen De Silva"
    ]

    var body: some View {
        ZStack {
            Color(red: 0.792, green: 0.941, blue: 0.973)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Header with Centered "My Chat" and User Icon on the Right
                HStack {
                    Spacer()
                    
                    Text("My Chat")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        showFriendRequests.toggle()
                    }) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                            .padding(.trailing, 16)
                    }
                }
                .padding(.top, 16)

                // Search Bar with Icon on the Right
                HStack {
                    TextField("Search by username", text: $searchText)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical)

                // Friend List and Group Chats
                List {
                    Section(header: Text("Friend List").font(.headline)) {
                        Text("Janith Perera")
                        Text("Rayan Fernando")
                        Text("Rowen De Silva")
                    }

                    Section(header: Text("Group Chats").font(.headline)) {
                        Text("Batch 23.2F Computing")
                    }
                }
                .listStyle(InsetGroupedListStyle())

                Spacer()
            }

            // Friend Requests Popup Full Width at the Bottom
            if showFriendRequests {
                VStack {
                    Spacer() // Pushes popup to the bottom

                    VStack {
                        Text("Friend Requests")
                            .font(.headline)
                            .padding(.top, 10)

                        ForEach(friendRequests, id: \.self) { request in
                            HStack {
                                Text(request)
                                    .foregroundColor(.black)

                                Spacer()

                                Button(action: {
                                    acceptRequest(request)
                                }) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                }

                                Button(action: {
                                    deleteRequest(request)
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        }

                        Button(action: {
                            showFriendRequests.toggle()
                        }) {
                            Text("Close")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity) // Full width
                    .background(Color.white)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .shadow(radius: 10)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }

    // Accept Request
    private func acceptRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }

    // Delete Request
    private func deleteRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }
}

// Helper extension for rounded corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PrivateChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrivateChatScreen()
    }
}


