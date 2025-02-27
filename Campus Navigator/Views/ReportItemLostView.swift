//
//  ReportItemLostView.swift
//  Campus Navigator
//
//  Created by Tharusha043 on 2025-02-27.
//
import SwiftUI

struct ReportItemLostView: View {
    @State private var lostItemName: String = ""
    @State private var description: String = ""
    @State private var locationLost: String = ""
    // Add state for image selection later

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Lost Item Name")
                    .font(.headline)

                TextField("Enter lost item Name", text: $lostItemName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Text("Description:")
                    .font(.headline)

                TextField("Enter Description", text: $description)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Text("Location Lost")
                    .font(.headline)

                TextField("Enter lost Location", text: $locationLost)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Text("Upload Image")
                    .font(.headline)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
                    .frame(height: 150)
                    .overlay(
                        Image(systemName: "camera")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    )

                Spacer() // Push content to the top
            }
            .padding()
            .navigationTitle("Report Item Lost")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Preview
struct ReportItemLostView_Previews: PreviewProvider {
    static var previews: some View {
        ReportItemLostView()
    }
}
