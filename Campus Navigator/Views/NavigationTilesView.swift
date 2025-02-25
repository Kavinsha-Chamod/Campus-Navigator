//
//  NavigationTilesView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-21.
//

import SwiftUI

import SwiftUI

struct NavigationTilesView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Campus Map",
                    image: "traveling",
                    color: (Color(hex: "4FAF5A")),
                    destination: CampusMapView()
                )
                NavigationTile(
                    title: "Mark Attendance",
                    image: "markattendance",
                    color: (Color(hex: "001AFF")),
                    destination: HomeView()
                )
            }
            
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Academic Help",
                    image: "program",
                    color: (Color(hex: "9900EF")),
                    destination: AvailabilityScreen()
                )
                NavigationTile(
                    title: "Availability",
                    image: "availability",
                    color: (Color(hex: "FF00AE")),
                    destination: HomeView()
                )
                
            }
            
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Clubs and Events",
                    image: "meeting",
                    color: (Color(hex: "B76F6F")),
                    destination: AvailabilityScreen()
                )
                NavigationTile(
                    title: "Class Schedule",
                    image: "calendar",
                    color: (Color(hex: "374151")),
                    destination: HomeView()
                )
            }
            HStack(spacing: 10) {
                NavigationTile(
                    title: "Lost and Found",
                    image: "lostItems",
                    color: (Color(hex: "FFA126")),
                    destination: AvailabilityScreen()
                )
                NavigationTile(
                    title: "Support Service",
                    image: "services",
                    color: (Color(hex: "FF0004")),
                    destination: HomeView()
                )
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}

