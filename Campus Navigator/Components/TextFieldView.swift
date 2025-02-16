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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 5)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .padding(.bottom, 15)
            
        }
        .padding(.horizontal, 20)
    }
}
