//
//  LostItemDetailsView.swift
//  Campus Navigator
//
//  Created by Tharusha043 on 2025-02-27.
//
import SwiftUI

struct LostItemDetailView: View {
    let imageName: String
    let itemName: String
    let reportedBy: String
    let locationLost: String
    let description: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                
                AsyncImage(url: URL(string: imageName)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                    case .failure:
                        Image("iphone1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 40)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(itemName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 10)
                        
                        Text("Reported by: \(reportedBy)")
                            .font(.headline)
                            .padding(.leading, 10)
                        
                        Text("Location Lost: \(locationLost)")
                            .font(.headline)
                            .padding(.leading, 10)
                        
                        Text("Description")
                            .font(.headline)
                            .padding(.top, 5)
                            .padding(.leading, 10)
                        
                        Text(description)
                            .font(.body)
                            .padding(.leading, 10)
                            .padding(.bottom, 20)
                    }
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 15)
                    
                }
                
                HStack {
                    Spacer()
                    NavigationLink(destination: AvalibileChatView()) {
                        HStack {
                            Text("Chat with Reporter")
                            Image(systemName: "paperplane.fill")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Lost Item Details")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }
}

struct LostItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemDetailView(
            imageName: "iphone1",
            itemName: "iPhone 16pro",
            reportedBy: "Amal Perera",
            locationLost: "Near the Campus Library Entrance",
            description: "Apple iPhone 16 Pro\nColor Space Black\nTransparent case with a small sticker of a blue star\nSlight scratch near the camera module"
        )
    }
}
