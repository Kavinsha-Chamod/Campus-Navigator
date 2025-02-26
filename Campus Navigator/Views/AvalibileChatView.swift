//
//  AvalibileChatScreen.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-20.
//

import SwiftUI

struct AvalibileChatView: View {
    @State private var message: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 255, green: 255, blue: 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Library Chat")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.black)

                Spacer()
                
                HStack {
                    Spacer()
                    Text("Is there any free seat for me?")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(24.5)
                        .padding(.horizontal)
                }
                
                HStack {
                    TextField("Enter your message", text: $message)
                        .padding()
                        .background((Color(hex: "F2F2F7")))
                        .cornerRadius(24.5)
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: sendMessage) {
                                    Image(systemName: "paperplane.fill")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 12)
                                }
                            }
                        )
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
    }
    
    func sendMessage() {
        print("Message sent: \(message)")
        message = ""
    }
}

#Preview {
    AvalibileChatView()
}

