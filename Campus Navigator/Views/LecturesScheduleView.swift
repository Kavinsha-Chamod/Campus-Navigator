import SwiftUI

struct LectureScheduleView: View {
    @State private var selectedDate: Int? = nil
    @State private var currentMonth: Int = 3
    @State private var currentYear: Int = 2025

    let dummyLectures: [Int: (String, String, String)] = [
        5: ("ML", "[Dr. Thisara]", "10:00 - 12:00"),
        12: ("Agile", "[Prof. John]", "13:00 - 15:00"),
        20: ("iOS", "[Mr. Fuzii]", "09:30 - 15:30"),
        25: ("AI", "[Dr. Samith]", "08:30 - 10:30")
    ]
    
    let monthNames = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    
    var daysInMonth: Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = calendar.date(from: dateComponents)!
        return calendar.range(of: .day, in: .month, for: date)!.count
    }
    
    var firstWeekday: Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: currentYear, month: currentMonth, day: 1)
        let date = calendar.date(from: dateComponents)!
        let weekday = calendar.component(.weekday, from: date) - 1
        return weekday
    }
    
    func previousMonth() {
        if currentMonth == 1 {
            currentMonth = 12
            currentYear -= 1
        } else {
            currentMonth -= 1
        }
    }
    
    func nextMonth() {
        if currentMonth == 12 {
            currentMonth = 1
            currentYear += 1
        } else {
            currentMonth += 1
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Month & Year Selector
                HStack {
                    Button(action: previousMonth) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Text("\(monthNames[currentMonth - 1]) \(currentYear)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: nextMonth) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 16)

                VStack(spacing: 10) {

                    HStack {
                        ForEach(["M", "T", "W", "T", "F", "S", "S"], id: \.self) { day in
                            Text(day)
                                .frame(width: 40, height: 40)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    // Calendar Dates
                    VStack(spacing: 10) {
                        let totalCells = ((daysInMonth + firstWeekday) / 7 + 1) * 7
                        
                        ForEach(0..<totalCells / 7, id: \.self) { week in
                            HStack {
                                ForEach(0..<7, id: \.self) { day in
                                    let date = week * 7 + day - firstWeekday + 1
                                    
                                    if date > 0 && date <= daysInMonth {
                                        Text("\(date)")
                                            .frame(width: 40, height: 40)
                                            .font(.subheadline)
                                            .background(
                                                selectedDate == date ? Color.blue :
                                                (dummyLectures.keys.contains(date) ? Color.blue.opacity(0.3) : Color.clear)
                                            )
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
                .background(Color(hex: "F6F6F6"))
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
