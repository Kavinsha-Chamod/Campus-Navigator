//
//  AvailabilityScreen.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-18.
//

import SwiftUI

struct AvailabilityScreen: View {
    var body: some View {
        ZStack {
            Color(red: 0.792, green: 0.941, blue: 0.973)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Public Places Availability")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .padding(.bottom, 20)

                ButtonTextField(
                    title: "Library Chat",
                    backgroundColor: Color(red: 153/255, green: 0/255, blue: 239/255, opacity: 5.49),
                    foregroundColor: .white,
                    action: { }
                )
                
                ButtonTextField(
                    title: "Cafeteria Chat",
                    backgroundColor: Color(hex: "9900EF").opacity(5.49),
                    foregroundColor: .white,
                    action: { }
                )

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .top)
            
            // "Ask a Friend" button at bottom right
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Action for "Ask a Friend" button
                    }) {
                        HStack {
                            Text("Ask a Friend")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            
                            Image(systemName: "paperplane.fill") // Arrow icon
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(24.5)
                        
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 5)
                }
            }
        }
    }
}

#Preview {
    AvailabilityScreen()
}



