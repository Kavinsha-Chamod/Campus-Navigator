//
//  NavigationTile.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-21.
//
import SwiftUI

struct NavigationTile<Destination: View>: View {
    let title: String
    let image: String
    let color: Color
    let isBigTile: Bool
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.2))
                    .shadow(radius: 3)
                
                VStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isBigTile ? 100 : 60, height: isBigTile ? 100 : 30)
                    
                    Text(title)
                        .font(.system(size: isBigTile ? 20 : 16, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.45, height: isBigTile ? 200 : 95)
        }
    }
}
