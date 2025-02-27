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
    let availability: AvailabilityStatus?
    let lastUpdated: String?
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}

enum AvailabilityStatus {
    case low, medium, high
    
    var color: Color {
        switch self {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
    
    var displayText: String {
        switch self {
        case .low: return "Available"
        case .medium: return "Medium"
        case .high: return "Busy"
        }
    }
    
    var currentText: String {
        switch self {
        case .low: return "No crowd, free to use."
        case .medium: return "Moderate crowd, some people."
        case .high: return "Busy/Crowded, hard to use."
        }
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.9736),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var selectedLocation: Location? = nil
    @State private var showReportModal = false
    @State private var showThankYouMessage = false
    @State private var selectedStatus: AvailabilityStatus? = nil
    
    @State private var navigateToChat = false
    
    let places = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.9836),
                 title: "Cafeteria",
                 info: "Enjoy coffee, snacks, and meals.",
                 place: "Main Building Block B",
                 time: "2 mins from your location",
                 availability: .low,
                 lastUpdated: "5 mins ago"),
        
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9571, longitude: 79.9536),
                 title: "Public Library",
                 info: "A place for books, quiet study, and reading.",
                 place: "Building floor 2",
                 time: "12 mins from your location",
                 availability: .medium,
                 lastUpdated: "10 mins ago"),
        
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9153, longitude: 79.9620),
                 title: "Study Area",
                 info: "A place to study with a calm environment",
                 place: "Block A",
                 time: "20 mins from your location",
                 availability: .high,
                 lastUpdated: "2 mins ago"),
        
        Location(coordinate: CLLocationCoordinate2D(latitude: 6.9053, longitude: 79.9900),
                 title: "Book Shop",
                 info: "Find books, stationery, and gifts.",
                 place: "Block A",
                 time: "20 mins from your location",
                 availability: nil,
                 lastUpdated: nil)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: places) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(place.availability?.color ?? .gray)
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
                                HStack {
                                    Text(selectedLocation.title)
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    if let availability = selectedLocation.availability {
                                        Text(availability.displayText)
                                            .font(.caption)
                                            .bold()
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 12)
                                            .background(availability.color.opacity(0.2))
                                            .foregroundColor(availability.color)
                                            .cornerRadius(15)
                                    }
                                }
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                                
                                Text(selectedLocation.info)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding([.leading, .trailing])
                                
                                Divider()
                                
                                HStack(alignment: .top) {
                                    DetailRow(title: "Place:", value: selectedLocation.place)
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 40)
                                        .foregroundColor(.gray.opacity(0.5))
                                    
                                    VStack(alignment: .leading) {
                                        DetailRow(title: "Estimation Time:", value: selectedLocation.time)
                                    }
                                }
                                
                                Divider()
                                
                                HStack(alignment: .top) {
                                    if let availability = selectedLocation.availability {
                                        DetailRow(title: "Current Status:", value: availability.currentText, color: availability.color)
                                    }
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 40)
                                        .foregroundColor(.gray.opacity(0.5))
                                    
                                    VStack(alignment: .leading) {
                                        if let lastUpdated = selectedLocation.lastUpdated {
                                            DetailRow(title: "Status Updated:", value: lastUpdated, color: .black)
                                        }
                                    }
                                }
                                
                                Divider()
                                
                                if selectedLocation.availability != nil && selectedLocation.lastUpdated != nil {
                                    HStack(spacing: 20) {
                                        Button(action: {
                                            showReportModal = true
                                        }) {
                                            HStack {
                                                Image(systemName: "square.and.pencil")
                                                Text("Report")
                                                    .font(.body)
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, maxHeight: 44)
                                            .background(Color.red.opacity(0.2))
                                            .foregroundColor(.red)
                                            .cornerRadius(8)
                                        }
                                        
                                        Button(action: {
                                            navigateToChat = true
                                        }) {
                                            HStack {
                                                Image(systemName: "book.fill")
                                                Text("Book Seat")
                                                    .font(.body)
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, maxHeight: 44)
                                            .background(Color.green.opacity(0.2))
                                            .foregroundColor(.green)
                                            .cornerRadius(8)
                                        }
                                        .disabled(selectedLocation.availability == .high)
                                        .opacity(selectedLocation.availability == .high ? 0.6 : 1.0)
                                    }
                                    .padding([.leading, .trailing, .bottom])
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 10)
                            .padding([.leading, .trailing])
                            .frame(maxWidth: .infinity)
                            .offset(y: -180)
                            .transition(.move(edge: .bottom))
                        }
                    }
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: selectedLocation)
                }
                
                // Report Modal
                if showReportModal {
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Help others and earn rewards!")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                                Text("How crowded is this place now?")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                            Button(action: {
                                selectedStatus = .low
                                showThankYouMessage = true
                            }) {
                                HStack {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.black)
                                    
                                    VStack(alignment: .leading) {
                                        Text("No Crowd")
                                            .font(.body)
                                            .bold()
                                            .foregroundColor(.black)
                                        Text("Free to use, plenty of space")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(selectedStatus == .low ? Color.green.opacity(0.5) : Color.blue.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal, 15)
                            
                            Button(action: {
                                selectedStatus = .medium
                                showThankYouMessage = true
                            }) {
                                HStack {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.black)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Moderate Crowd")
                                            .font(.body)
                                            .bold()
                                            .foregroundColor(.black)
                                        Text("Some people, limited space")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(selectedStatus == .medium ? Color.yellow.opacity(0.5) : Color.blue.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal, 15)
                            
                            Button(action: {
                                selectedStatus = .high
                                showThankYouMessage = true
                            }) {
                                HStack {
                                    Image(systemName: "person.3.fill")
                                        .foregroundColor(.black)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Busy / Crowd")
                                            .font(.body)
                                            .bold()
                                            .foregroundColor(.black)
                                        Text("Full, hard to access")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(selectedStatus == .high ? Color.red.opacity(0.5) : Color.blue.opacity(0.1))
                                .cornerRadius(10)
                            }
                            .padding(.horizontal, 15)
                            
                            if showThankYouMessage {
                                VStack(alignment: .leading) {
                                    Text("Thank you for your update!")
                                        .font(.body)
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.top, 10)
                                    
                                    Text("You’ve earned 10 Level-Up Points for helping others!")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 15)
                            }
                            
                            Button(action: {
                                showReportModal = false
                            }) {
                                HStack{
                                    Text("Done")
                                        .font(.body)
                                        .foregroundColor(.white)
                                    
                                }.padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .background( Color.blue)
                                    .cornerRadius(10)
                            }.padding(.horizontal, 15)
                            
                                .padding(.bottom, 20)
                        }
                        .padding(.bottom, 30)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .frame(maxWidth: .infinity)
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: showReportModal)
                    }
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black.opacity(0.4).onTapGesture {
                    })
                    .offset(y: UIScreen.main.bounds.height * 0.05)
                }
            }
            NavigationLink("", destination: ChatView(), isActive: $navigateToChat)
        }
    }
    
}

struct DetailRow: View {
    let title: String
    let value: String
    var color: Color = .black
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.leading)
            Text(value)
                .font(.body)
                .foregroundColor(color)
                .padding([.leading, .bottom, .trailing])
        }
    }
}

#Preview{
    MapView()
}
