//
//  TextField.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//

import SwiftUI

struct TextInputView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black)
                .padding(.horizontal, 10)

            ZStack(alignment: .trailing) {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 25)
                        .background(Color(hex:"#F2F2F7"))
                        .cornerRadius(10)
                        .font(.system(size: 16))
                } else {
                    TextField(placeholder, text: $text)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 25)
                        .background(Color(hex:"#F2F2F7"))
                        .cornerRadius(10)
                        .font(.system(size: 16))
                }

                if isSecure {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 15)
                    }
                }
            }.padding(.horizontal, 10)
        }
        .padding(.vertical, 5)
    }
}
