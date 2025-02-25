//
//  MapView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-24.
//

import SwiftUI
import MapKit

struct Location: Identifiable, Equatable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let info: String
    let place: String
    let time: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.9736),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var selectedLocation: Location? = nil
    
    let places = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.9736), title: "Cafeteria", info: "Here you can enjoy coffee, snacks, and meals.", place: "Main Building Block B", time: "2 mins from your location"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9571, longitude: 79.9536), title: "Public Library", info: "A place for books, quiet study, and reading.", place: "Building floor 2", time: "12 mins from your location"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9053, longitude: 79.9900), title: "Book Shop", info: "Find a wide range of books, stationery, and gifts here.", place: "Block A", time: "20 mins from your location")
    ]
    
    var body: some View {
        ZStack {
            // Map View
            Map(coordinateRegion: $region, annotationItems: places) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                        Text(place.title)
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    .onTapGesture {
                        selectedLocation = place
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            if let selectedLocation = selectedLocation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.selectedLocation = nil
                    }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(alignment: .leading) {
                            Text(selectedLocation.title)
                                .font(.title2)
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                                .foregroundColor(.black)
                            
                            Text(selectedLocation.info)
                                .font(.body)
                                .padding([.leading, .bottom, .trailing])
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading) {
                                Text("Place:")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Text(selectedLocation.place)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding([.leading, .bottom, .trailing])
                                
                                Text("Time:")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.leading)
                                Text(selectedLocation.time)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding([.leading, .bottom, .trailing])
                            }
                           
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .padding(20)
                        .frame(maxWidth: 350)
                        .offset(y: -180)
                        .transition(.move(edge: .bottom))
                    }
                }
                .transition(.move(edge: .bottom))
                .animation(.spring(), value: selectedLocation)
            }
        }
    }
}
