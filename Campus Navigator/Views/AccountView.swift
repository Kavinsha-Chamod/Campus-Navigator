//  AccountView.swift
//  Campus Navigator
//
//  Created by Tharusha Rajapaksha on 2025-02-27.
//

import SwiftUI

struct AccountView: View {
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

struct ProfileRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
