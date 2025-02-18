//
//  TextComponent.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-18.
//

import SwiftUI

struct ButtonTextField: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: 350)
                .background(backgroundColor.opacity(0.55)) // Added opacity here
                .cornerRadius(10)

        }
        .padding(.horizontal, 10)
    }
}

// Extension to support hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        r = Double((int >> 16) & 0xFF) / 255.0
        g = Double((int >> 8) & 0xFF) / 255.0
        b = Double(int & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}



