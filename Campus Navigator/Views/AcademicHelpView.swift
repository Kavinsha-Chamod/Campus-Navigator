//
//  AcademicHelpView.swift
//  Campus Navigator
//
//  Created by Tharusha Rajapaksha on 2025-02-26.
//

import SwiftUI

struct AcademicHelpView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: String = "Lecturers"
    
    let lecturers = ["Kavindu Senadeera", "Rayan Fernando", "Rowen De Silva"]
    let instructors = ["Isuru Prabhath", "Kavinda Dilshan", "Ishini Perera"]
    
    var filteredList: [String] {
        let list = selectedTab == "Lecturers" ? lecturers : instructors
        return searchText.isEmpty ? list : list.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                HStack { 
                    Spacer()
            
                }
                .padding(.horizontal)
                
                HStack {
                    Button(action: { selectedTab = "Lecturers" }) {
                        Text("Available Lecturers")
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .foregroundColor(.black)
                            .background(selectedTab == "Lecturers" ? Color.white : Color(.systemGray5))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedTab == "Lecturers" ? Color.white : Color.clear, lineWidth: 1)
                            )
                    }
                    
                    Button(action: { selectedTab = "Instructors" }) {
                        Text("Available Instructors")
                            .frame(maxWidth: .infinity, minHeight: 45)
                            .foregroundColor(.black)
                            .background(selectedTab == "Instructors" ? Color.white : Color(.systemGray5))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedTab == "Instructors" ? Color.white : Color.clear, lineWidth: 1)
                            )
                    }
                }
                .padding(5)
                .frame(maxWidth: .infinity, minHeight: 45)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                Text("List of \(selectedTab)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                VStack(spacing: 10) {
                    ForEach(filteredList, id: \.self) { name in
                        NavigationLink(destination: AcademicHelpProfile()) {
                            HStack {
                                Text(name)
                                    .font(.system(size: 17, weight: .medium))
                                    .foregroundColor(.black)
                                    .padding(.leading, 15)
                                
                                Spacer()
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
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
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

struct AcademicHelpView_Previews: PreviewProvider {
    static var previews: some View {
        AcademicHelpView()
    }
}
