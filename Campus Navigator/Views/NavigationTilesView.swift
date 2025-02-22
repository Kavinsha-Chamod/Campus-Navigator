//
//  NavigationTilesView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-21.
//

import SwiftUI

struct NavigationTilesView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Campus Map",
                    image: "CampusMapIcon",
                    color: Color(red: 72/255, green: 202/255, blue: 228/255,
                                 opacity: 0.5),
                    isBigTile: true,
                    destination: CampusMapView()
                )
                
                VStack(spacing: 10) {
                    NavigationTile(
                        title: "Availability",
                        image: "AvailabilityIcon",
                        color: Color(red: 72/255, green: 202/255, blue: 228/255, opacity: 1),
                        isBigTile: false,
                        destination: HomeView()
                    )
                    
                    NavigationTile(
                        title: "Clubs or Events",
                        image: "directoryIcon",
                        color: Color(red: 52/255, green: 153/255, blue: 173/255, opacity: 1),
                        isBigTile: false,
                        destination: AvailabilityScreen()
                    )
                }
            }
            
            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    NavigationTile(
                        title: "Class Schedule",
                        image: "libraryIcon",
                        color: Color(red: 62/255, green: 173/255, blue: 195/255, opacity: 1),
                        isBigTile: false,
                        destination: HomeView()
                    )
                    NavigationTile(
                        title: "Support Services",
                        image: "settingsIcon",
                        color: Color.red,
                        isBigTile: false,
                        destination: HomeView()
                    )
                }
                
                NavigationTile(
                    title: "Mark Attendance",
                    image: "transportIcon",
                    color: Color(red: 62/255, green: 173/255, blue: 195/255, opacity: 1),
                    isBigTile: true,
                    destination: HomeView()
                )
            }
            
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Academic Help",
                    image: "transportIcon",
                    color: Color(red: 72/255, green: 202/255, blue: 228/255, opacity: 1),
                    isBigTile: true,
                    destination: HomeView()
                )
                VStack(spacing: 10) {
                    NavigationTile(
                        title: "Lost and Found",
                        image: "libraryIcon",
                        color: Color.green,
                        isBigTile: false,
                        destination: HomeView()
                    )
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
