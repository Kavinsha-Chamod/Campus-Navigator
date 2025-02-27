//
//  LostItemDetailsView.swift
//  Campus Navigator
//
//  Created by Tharusha043 on 2025-02-27.
//
import SwiftUI

import SwiftUI

struct LostItemDetailView: View {
    let imageName: String
    let itemName: String
    let reportedBy: String
    let locationLost: String
    let description: String

    var body: some View {
        NavigationView {
            VStack {
                Image(imageName) // Or use AsyncImage if it's a URL
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(maxWidth: .infinity) // Ensure image takes full width

                VStack(alignment: .leading, spacing: 10) {
                    Text(itemName)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Reported by: \(reportedBy)")
                        .font(.headline)

                    Text("Location Lost: \(locationLost)")
                        .font(.headline)

                    Text("Description")
                        .font(.headline)
                        .padding(.top, 5)

                    Text(description)
                        .font(.body)
                }
                .padding(.horizontal)

                Spacer()

                HStack {
                    Spacer()
                    Button(action: {
                        // Action for chatting with the reporter
                    }) {
                        HStack {
                            Text("Chat with Reporter")
                            Image(systemName: "paperplane.fill")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25) // Make it fully rounded
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .navigationTitle("Lost and Found")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Example usage and preview
struct LostItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemDetailView(
            imageName: "https://i.dummyjson.com/data/products/3/thumbnail.jpg", 
            itemName: "iPhone 16pro",
            reportedBy: "Amal Perera",
            locationLost: "Near the Campus Library Entrance",
            description: "Apple iPhone 16 Pro\nColor Space Black\nTransparent case with a small sticker of a blue star\nSlight scratch near the camera module"
        )
    }
}
