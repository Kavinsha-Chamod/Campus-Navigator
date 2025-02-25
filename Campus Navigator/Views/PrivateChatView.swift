//
//  PrivateChatScreen.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-20.
//

import SwiftUI

struct PrivateChatView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Search bar
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
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onAppear {
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(
                    string: "Search...",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Chat")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FriendRequestView()) {
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    PrivateChatView()
}
