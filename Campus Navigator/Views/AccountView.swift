//  AccountView.swift
//  Campus Navigator
//
//  Created by Tharusha Rajapaksha on 2025-02-27.
//

import SwiftUI

struct AccountView: View {
    @State private var isLoggedOut = false  // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 120, height: 120)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .shadow(radius: 5)

                List {
                    Section(header: Text("PROFILE")) {
                        ProfileRow(label: "Username", value: "john_doe")
                        ProfileRow(label: "Name", value: "John Doe")
                        ProfileRow(label: "Email", value: "john.doe@example.com")
                    }
                    
                    Section {
                        Button(action: {
                            isLoggedOut = true
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
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $isLoggedOut
                ) {
                    EmptyView()
                }
            }
            .background(Color.clear)
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
