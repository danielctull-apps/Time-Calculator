
import SwiftUI

struct CalendarPicker: View {

    @State private var date = Date()

    @State private var calendarIdentifier = Calendar.current.identifier
    @State private var timeZoneIdentifier = TimeZone.current.id
    @State private var components = DateComponents()

    private func resetComponents() { components = DateComponents() }

    private var calendar: Calendar { Calendar(identifier: calendarIdentifier) }
    private var timeZone: TimeZone { TimeZone(identifier: timeZoneIdentifier) }

    private var output: String {
        guard let new = calendar.date(byAdding: components, to: date) else { return "" }

        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.dateStyle = .long
        formatter.timeZone = timeZone
        return formatter.string(from: new)
    }

    var body: some View {
        NavigationView {
            Form {

                Section {
                    DatePicker(selection: $date, label: { Text("Date") })
                }

                Section {
                    Picker(selection: $calendarIdentifier, label: Text("Calendar"))
                }

                Section {
                    Picker(selection: $timeZoneIdentifier, label: Text("Time Zone"))
                }

                Section {
                    Stepper("Years: \(components.years)", value: $components.years)
                    Stepper("Weeks: \(components.weeks)", value: $components.weeks)
                    Stepper("Months: \(components.months)", value: $components.months)
                    Stepper("Days: \(components.days)", value: $components.days)
                    Stepper("Hours: \(components.hours)", value: $components.hours)
                    Stepper("Minutes: \(components.minutes)", value: $components.minutes)
                    Stepper("Seconds: \(components.seconds)", value: $components.seconds)
                    Button(action: resetComponents, label: { Text("Reset") })
                }

                Section(header: Text("Result")) {
                    Text(output)
                }
            }
            .navigationBarTitle("Time", displayMode: .inline)
        }
    }
}

struct CalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPicker()
    }
}

extension Binding {

    init(_ optional: Binding<Value?>, default: Value) {
        self.init(get: { optional.wrappedValue ?? `default` },
                  set: { optional.wrappedValue = $0 })
    }
}

func ??<Value>(lhs: Binding<Value?>, rhs: Value) -> Binding<Value> {
    Binding(lhs, default: rhs)
}

extension DateComponents {

    var years: Int {
        get { year ?? 0 }
        set { year = newValue }
    }
    var months: Int {
        get { month ?? 0 }
        set { month = newValue }
    }
    var weeks: Int {
        get { weekOfYear ?? 0 }
        set { weekOfYear = newValue }
    }
    var days: Int {
        get { day ?? 0 }
        set { day = newValue }
    }
    var hours: Int {
        get { hour ?? 0 }
        set { hour = newValue }
    }
    var minutes: Int {
        get { minute ?? 0 }
        set { minute = newValue }
    }
    var seconds: Int {
        get { second ?? 0 }
        set { second = newValue }
    }
}


//    @State private var years = 0
//    @State private var months = 0
//    @State private var weeks = 0
//    @State private var days = 0
//    @State private var hours = 0
//    @State private var minutes = 0
//    @State private var seconds = 0


//    private var components: DateComponents {
//        DateComponents(calendar: calendar,
//                       year: years,
//                       month: months,
//                       day: days,
//                       hour: hours,
//                       minute: minutes,
//                       second: seconds,
//                       weekOfYear: weeks)
//    }


//        years = 0
//        months = 0
//        weeks = 0
//        days = 0
//        hours = 0
//        minutes = 0
//        seconds = 0
//    }
