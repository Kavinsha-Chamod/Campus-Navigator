//
//  CampusMapView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-21.
//

import SwiftUI

struct VisualEffectBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct CampusMapView: View {
    @State private var searchText: String = ""
    @State private var selectedPlace: String? = nil
    @State private var showPopup: Bool = false
    
    let places = ["Cafeteria", "Book Shop", "Library", "Program Office"]
    
    let directions: [String: [(String, String)]] = [
        "Cafeteria": [
            ("figure.walk", "Start at the Main Entrance of Building 01."),
            ("arrow.up", "Walk straight ahead towards the Reception Desk."),
            ("arrow.turn.up.right", "Turn right after the reception."),
            ("arrow.turn.right.up", "Take the Elevator or Staircase to Floor 4."),
            ("arrow.turn.right.up", "Exit the Elevator/Staircase and turn left."),
            ("arrow.up", "Follow the hallway past Room 401 & 402."),
            ("arrow.up.forward", "Harrison Hall will be on your right."),
            ("mappin.and.ellipse", "You’ve arrived at Harrison Hall.")
        ],
        "Library": [
            ("figure.walk", "Start at the Entrance of Library Building."),
            ("arrow.up", "Walk straight past the information desk."),
            ("arrow.turn.up.right", "Turn right towards Study Room A."),
            ("arrow.turn.right.up", "Go up to the 2nd floor."),
            ("arrow.up", "Walk straight until you reach the Fiction section."),
            ("mappin.and.ellipse", "You’ve arrived at the Library.")
        ],
        "Book Shop": [
            ("figure.walk", "Start at the Main Entrance of Building 02."),
            ("arrow.up", "Walk straight towards the main hallway."),
            ("arrow.turn.up.right", "Turn right at the intersection."),
            ("arrow.up", "Continue walking past the Art Gallery."),
            ("arrow.up.forward", "The Book Shop will be on your left."),
            ("mappin.and.ellipse", "You’ve arrived at the Book Shop.")
        ],
        "Program Office": [
            ("figure.walk", "Start at the Main Entrance of Building 03."),
            ("arrow.up", "Walk towards the Information Counter."),
            ("arrow.turn.up.right", "Turn right and walk past the Administration Office."),
            ("arrow.turn.right.up", "Take the Elevator to Floor 2."),
            ("arrow.turn.right.up", "Exit the Elevator and turn left."),
            ("arrow.up.forward", "Walk past Room 210 and 211."),
            ("mappin.and.ellipse", "You’ve arrived at the Program Office.")
        ]
    ]
    
    var filteredPlaces: [String] {
        if searchText.isEmpty {
            return places
        } else {
            return places.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                MapView()
                
                VStack {
                    VStack {
                        Text("Frequently Searched Places")
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            .padding(.leading, 20)
                            .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(filteredPlaces, id: \.self) { place in
                                    Button(action: {
                                        selectedPlace = place
                                        withAnimation(.spring()) {
                                            showPopup = true
                                        }
                                    }) {
                                        HStack {
                                            Image(systemName: "location.circle.fill")
                                                .foregroundColor(.blue)
                                                .frame(width: 25, height: 25)
                                            Text(place)
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                        }
                                        .padding(8)
                                        .padding(.horizontal, 10)
                                        .background(Color.gray.opacity(0.5))
                                        .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background(VisualEffectBlur(style: .systemMaterialLight))
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                
                // Popup for selected place
                if showPopup, let selectedPlace = selectedPlace {
                    ZStack {
                        Color.black.opacity(0.6)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showPopup = false
                                }
                            }
                        
                        VStack {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("\(selectedPlace) Block B Floor 2")
                                    .font(.title2)
                                    .bold()
                                    .padding(.top, 15)
                                    .padding(.leading, 20)
                                Text("Directions")
                                    .font(.system(size: 16))
                                    .padding(.leading, 20)
                                
                                ScrollView {
                                    VStack(alignment: .leading, spacing: 12) {
                                        ForEach(directions[selectedPlace] ?? [], id: \.1) { step in
                                            HStack {
                                                Image(systemName: step.0)
                                                    .font(.title2)
                                                    .frame(width: 30)
                                                Text(step.1)
                                                    .font(.body)
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal, 20)
                                        }
                                    }
                                }
                                .padding(.vertical, 10)
                                
                                Button(action: {
                                    withAnimation(.spring()) {
                                        showPopup = false
                                    }
                                }) {
                                    Text("Close")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .padding(.bottom, 15)
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 400)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .transition(.move(edge: .bottom))
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    }
                    .animation(.spring(), value: showPopup)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onAppear {
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(
                    string: "Search...",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Campus Map")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
    }
}

#Preview {
    CampusMapView()
}
