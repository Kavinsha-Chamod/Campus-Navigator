//  FriendRequestView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-25.
//

import SwiftUI

struct FriendRequestView: View {
    @State private var searchText: String = ""
    @State private var friendRequests = [
        "Janith Perera",
        "Rayan Fernando",
        "Rowen De Silva"
    ]
    
    var filteredRequests: [String] {
        searchText.isEmpty ? friendRequests : friendRequests.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(spacing: 10) {
                    ForEach(filteredRequests, id: \ .self) { request in
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                                .padding(.horizontal, 5)
                            
                            Text(request)
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                            
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
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }
                Spacer()
            }
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
                Text("Friend Requests")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }
    
    private func acceptRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }
    
    private func deleteRequest(_ name: String) {
        friendRequests.removeAll { $0 == name }
    }
}

struct FriendRequestView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestView()
    }
}
