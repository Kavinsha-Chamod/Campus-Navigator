//
//  FriendRequestView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-25.
//
import SwiftUI

struct FriendRequestView: View {
    @State private var friendRequests = [
        "Janith Perera",
        "Rayan Fernando",
        "Rowen De Silva"
    ]
    
    var body: some View {
        VStack {
            
            List {
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
                    .padding(.vertical, 5)
                }
            }
        }
        .navigationTitle("Friend Requests")
    }
    
    private func acceptRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }
    
    private func deleteRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }
}

struct PrivateChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrivateChatView()
    }
}
