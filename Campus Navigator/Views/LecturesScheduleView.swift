//  LecturesScheduleView.swift
//  Campus Navigator
//
//  Created by Gayan Kavinda on 2025-02-28.
//

import SwiftUI

struct LectureScheduleView: View {
    @State private var selectedDate: Int? = nil
    
    let dummyLectures: [Int: (String, String, String)] = [
        5: ("Math", "[Dr. Smith]", "10:00 - 12:00"),
        12: ("Physics", "[Prof. Johnson]", "13:00 - 15:00"),
        20: ("IOS", "[Mr. Fuzii]", "09:30 - 15:30"),
        25: ("AI", "[Dr. Lee]", "08:30 - 10:30")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Back Button
                HStack {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                // Calendar Grid with Background Color
                VStack(spacing: 10) {
                    Text("Mar 2025")
                        .font(.headline)
                    
                    // Days of the Week
                    HStack {
                        ForEach(["M", "T", "W", "T", "F", "S", "S"], id: \.self) { day in
                            Text(day)
                                .frame(width: 40, height: 40)
                                .font(.subheadline)
                        }
                    }
                    
                    // Calendar Dates
                    VStack(spacing: 10) {
                        ForEach(0..<5) { week in
                            HStack {
                                ForEach(0..<7) { day in
                                    let date = week * 7 + day + 1
                                    if date <= 31 {
                                        Text("\(date)")
                                            .frame(width: 40, height: 40)
                                            .font(.subheadline)
                                            .background(selectedDate == date ? Color.blue : Color.clear)
                                            .cornerRadius(20)
                                            .foregroundColor(selectedDate == date ? .white : .primary)
                                            .onTapGesture {
                                                selectedDate = date
                                            }
                                    } else {
                                        Spacer().frame(width: 40, height: 40)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(Color(hex: "F6F6F6")) // Background color added
                .cornerRadius(10)
                .padding(.horizontal, 16)
                
                // Lecture Details Section
                if let selectedDate = selectedDate, let lecture = dummyLectures[selectedDate] {
                    HStack {
                        Text(lecture.0)
                            .font(.headline)
                        Text(lecture.1)
                            .font(.headline)
                        Spacer()
                        Text(lecture.2)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 30)
                } else {
                    Text("No lectures scheduled for this date")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal, 30)
                }

                Spacer()
            }
            .navigationBarTitle("Lectures Schedule", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Lectures Schedule")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}


struct LectureScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        LectureScheduleView()
    }
}
