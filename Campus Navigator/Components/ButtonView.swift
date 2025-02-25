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
    var action: (() -> Void)? = nil
    var destination: AnyView? = nil
    
    var body: some View {
        if let destination = destination {
            NavigationLink(destination: destination) {
                buttonContent
            }
            .buttonStyle(PlainButtonStyle()) 
        } else {
            Button(action: {
                action?()
            }) {
                buttonContent
            }
        }
    }
    
    private var buttonContent: some View {
        Text(title)
            .font(.system(size: 16, weight: .regular, design: .default))
            .foregroundColor(foregroundColor)
            .padding()
            .frame(maxWidth: 250)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2)
            )
            .padding(.horizontal, 10)
    }
}

