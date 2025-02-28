//  PrivateChatView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-20.
//

import SwiftUI

struct PrivateChatView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: String = "Friends"
    
    let friends = ["Janith Perera", "Rayan Fernando", "Rowen De Silva"]
    let groupChats = ["Batch 23.2F Computing", "Project Team Alpha"]
    let chatTimes = ["10:45 AM", "Yesterday", "2 days ago", "3 days ago"]
    
    var filteredList: [String] {
        return selectedTab == "Friends" ? friends : groupChats
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Button(action: { selectedTab = "Friends" }) {
                        Text("Friends List")
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .foregroundColor(.black)
                            .background(selectedTab == "Friends" ? Color.white : Color(.systemGray5))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedTab == "Friends" ? Color.white : Color.clear, lineWidth: 1)
                            )
                    }
                    
                    Button(action: { selectedTab = "Groups" }) {
                        Text("Group Chats")
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .foregroundColor(.black)
                            .background(selectedTab == "Groups" ? Color.white : Color(.systemGray5))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedTab == "Groups" ? Color.white : Color.clear, lineWidth: 1)
                            )
                    }
                }
                .padding(5)
                .frame(maxWidth: .infinity, minHeight: 45)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                
                VStack(spacing: 10) {
                    ForEach(filteredList.indices, id: \ .self) { index in
                        NavigationLink(destination: AvalibileChatView()) {
                            HStack {
                                Image(systemName: selectedTab == "Friends" ? "person.circle.fill" : "person.3.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(selectedTab == "Friends" ? .blue : .blue)
                                    .padding(.horizontal, 5)
                                
                                Text(filteredList[index])
                                    .font(.system(size: 17, weight: .medium))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                                
                                Spacer()
                                
                                Text(chatTimes[index % chatTimes.count])
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 5)
                            }
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
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
                    Text("Academic Help")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
    }
    }


struct PrivateChatView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateChatView()
    }
}
