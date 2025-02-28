//  ClubsInfoView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-28.
//

import SwiftUI

struct ClubsInfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) { // Reduced spacing
                    Image("Leo-logo")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    Text("""
                    The NIBM Leo Club is a youth organization affiliated with the Lions Clubs International, operating at the National Institute of Business Management (NIBM) in Sri Lanka.
                    
                    It focuses on leadership development, community service, and personal growth. Members engage in various social and charitable activities, such as organizing blood donation camps, environmental projects, and educational programs, while fostering teamwork, leadership skills, and a spirit of volunteerism.
                    """)
                    .font(.body)
                    .lineSpacing(6)
                    .multilineTextAlignment(.leading)
                    
                    ButtonView(
                        title: "Register Now",
                        backgroundColor: Color(hex:"007AFF"),
                        foregroundColor: .white,
                        borderColor: Color(hex:"007AFF"),
                        action: {
                            
                        }
                    )
                    .frame(maxWidth: .infinity) // Increased button width
                    .padding(.top, 10) // Added slight spacing for better layout
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("Clubs and Events", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Clubs and Events")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct NIBMLeoClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubsInfoView()
    }
}
