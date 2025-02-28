//  ClubsEnrollView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-26.
//

import SwiftUI

struct ClubsEnrollView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    NavigationTile(
                        title: "NIBM Leo Club",
                        image: "computer-club",
                        color: (.blue),
                        destination: ClubsInfoView()
                    )
                    NavigationTile(
                        title: "NIBM Rotaract Club",
                        image: "game 1",
                        color: (.blue),
                        destination: ClubsInfoView()
                    )
                }
                HStack(spacing: 10) {
                    NavigationTile(
                        title: "NIBM Computer Club",
                        image: "golf-club 1",
                        color: (.blue),
                        destination: ClubsInfoView()
                    )
                    NavigationTile(
                        title: "NIBM Sports Club",
                        image: "night-club 1",
                        color: (.blue),
                        destination: ClubsInfoView()
                    )
                }
            }
            .navigationBarTitle("Clubs and Events", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Clubs and Events")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            .padding(.top, -250)
        }
    }
}

#Preview {
    ClubsEnrollView()
}
