//  SupportServicesView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-26.
//

import SwiftUI

struct SupportServicesView: View {
    var body: some View {
        NavigationView {
            List {
                Section() {
                    ServiceRow(serviceName: "Medical Support", hours: "0800 AM-0400 PM, Monday-Friday", location: "Medical Center, Block A", contact: "0172543234", additionalInfo: "Campus safety, lost and found, emergency")
                }
                
                Section() {
                    ServiceRow(serviceName: "Security Support", hours: "24/7", location: "Security Office, Main Gate", contact: "011 2652764", additionalInfo: "Campus safety, lost and found, emergency")
                }
                
                Section() {
                    ServiceRow(serviceName: "Program Office", hours: "0800 AM-0400 PM, Monday-Friday", location: "Academic Building 4th floor Room 101", contact: "0172543234", additionalInfo: "Course registrations, Academic advising, Timetable issues, Student enrollment")
                }
                
                Section() {
                    ServiceRow(serviceName: "International Office", hours: "1000 AM-0300 PM, Monday-Friday", location: "Admin Block 2nd floor Room 10", contact: "0172543234", additionalInfo: "Visa support, international student services")
                }
                
                Section() {
                    ServiceRow(serviceName: "Exam Unit", hours: "0800 AM-0500 PM, Monday-Friday", location: "Examination Office, Block B", contact: "0172543234", additionalInfo: "Exam schedules, Results inquiries, Re-evaluations, Certificate issues")
                }
                
                Section() {
                    ServiceRow(serviceName: "Bookshop", hours: "0800 AM-0500 PM, Monday-Sunday", location: "Student Center, Ground floor", contact: "0172543234", email: "bookshop@campus.edu", additionalInfo: "Academic books, Stationaries, Campus merchandise")
                }
            }
            .listRowBackground(Color(hex: "#F2F2F7"))  // List row background color
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)  // Page background color
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Support Service")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ServiceRow: View {
    var serviceName: String
    var hours: String
    var location: String
    var contact: String
    var email: String?
    var additionalInfo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(serviceName)
                .font(.headline)
            Text("Hours: \(hours)")
                .font(.subheadline)
            Text("Location: \(location)")
                .font(.subheadline)
            Text("Contact: \(contact)")
                .font(.subheadline)
            if let email = email {
                Text("Email: \(email)")
                    .font(.subheadline)
            }
            Text("Services: \(additionalInfo)")
                .font(.subheadline)
        }
        .padding(.vertical, 8)
    }
}

struct CampusServicesView_Previews: PreviewProvider {
    static var previews: some View {
        SupportServicesView()
    }
}


