//
//  AcademicHelpProfile.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-28.
//

import SwiftUI

struct AcademicHelpProfile: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                }
                .padding(10)
                
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 5)

                Text("Kavindu Senadeera")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 8)

                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(title: "Module Conduct", value: "Introduction to Machine Learning")
                    InfoRow(title: "Email address", value: "kavindusenadeera@campus.edu", isLink: true)
                    InfoRow(title: "Contact number", value: "+94 71 234 5678")
                    InfoRow(title: "Meet at", value: "General Block, Room 205, 4th Floor")
                    InfoRow(title: "Time available", value: "08:30 AM - 10:30 AM\nMonday and Wednesday")
                }
                .padding()
                
                Spacer()
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Profile of Academic Help")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    var isLink: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            if isLink {
                Text(value)
                    .font(.body)
                    .foregroundColor(.blue)
                    .underline()
            } else {
                Text(value)
                    .font(.body)
                    .foregroundColor(.black)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
         .padding(.top, 10)
    }
}

struct AcademicHelpProfile_Previews: PreviewProvider {
    static var previews: some View {
        AcademicHelpProfile()
    }
}
