//
//  Button.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//
import SwiftUI

struct ButtonView: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var borderColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: 250)
                .background(backgroundColor)
                .cornerRadius(50)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(borderColor, lineWidth: 2))
        }
        .padding(.horizontal, 10)
    }
}
