//
//  AvailabilityScreen.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-18.
//

import SwiftUI

struct AvailabilityView: View {
    var body: some View {
        ZStack {
            Color(red: 255, green: 255, blue: 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Public Places Availability")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.bottom, 20)

                HStack(spacing: 10) {
                    NavigationTile(
                        title: "Library Chat",
                        image: "library 1",
                        color: (Color(hex: "007AFF")),
                        destination: AvalibileChatView()
                    )
                    NavigationTile(
                        title: "Cafeteria Chat",
                        image: "cafeteria 1",
                        color: (Color(hex: "007AFF")),
                        destination: AvalibileChatView()
                    )
                }
                VStack() {
                    NavigationTile(
                        title: "Study Area Chat",
                        image: "studying 1",
                        color: (Color(hex: "007AFF")),
                        destination: AvalibileChatView()
                    )
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .top)
            
        }
    }
}

#Preview {
    AvailabilityView()
}



