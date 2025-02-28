//
//  ClubsInfoView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-28.
//


import SwiftUI

struct ClubsInfoView: View {
    var body: some View {
        NavigationView {
            List {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                Section(header: Text("PROFILE")) {
                    ProfileRow(label: "Username", value: "john_doe")
                    ProfileRow(label: "Name", value: "John Doe")
                    ProfileRow(label: "Email", value: "john.doe@example.com")
                }
                
                Section {
                    Button(action: {
                        // Action for logout
                        print("User logged out")
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Account")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}


struct ClubsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ClubsInfoView()
    }
}
