//
//  Untitled.swift
//  Campus Navigator
//
//  Created by Tharusha Rajapaksha on 2025-02-27.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Academic Help")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                
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
            .navigationBarBackButtonHidden(true) // This removes the back arrow
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
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
