
import Foundation
import Apollo

class EventViewModel: Identifiable {
    
    let startEvent: String
    let endEvent: String
    let description: String?
    let bandName: String
    let duration: Int
    let timeSlot: [TimeSlot]?
    
    init(startEvent: String, endEvent: String, description: String?, bandName: String, duration: Int, timeSlot: [TimeSlot]?) {
        self.startEvent = startEvent
        self.endEvent = endEvent
        self.description = description
        self.bandName = bandName
        self.duration = duration
        self.timeSlot = timeSlot
    }
    
//    func performEventsQuery() {
//        Network.shared.apollo.fetch(query: EventsQuery()) { result in
//            switch result {
//            case .success(let graphQLResult):
//                type(of: self).init(startEvent: <#T##String#>, endEvent: <#T##String#>, description: <#T##String?#>, bandName: <#T##String#>)
//            case .failure(let error):
//            print(error)
//            }
//        }
//    }
    
    static func from(edge: EventsQuery.Data.Event.Edge) -> EventViewModel {
        let content = edge
        
        let startEvent = content.node.startsAt
        let endEvent = content.node.endsAt
        let description = content.node.description
        let bandName = content.node.band.name
        let duration = content.node.interviewDuration
        let timeSlot: [TimeSlot] = content.node.timeSlots!.map { timeSlot in
            let date = Date()
            let dateForm = ISO8601DateFormatter()
            dateForm.timeZone = TimeZone.current
            let newDate = dateForm.date(from: timeSlot!.startsAt)
//            let dateFormatter = DateFormatter()
//            let newDate = dateFormatter.date(from: timeSlot!.startsAt)""

            // *** create calendar object ***
            var calendar = Calendar.current

            // *** Get components using current Local & Timezone ***
            print(calendar.dateComponents([.year, .month, .day, .hour, .minute], from: newDate ?? date))

            // *** define calendar components to use as well Timezone to UTC ***
            calendar.timeZone = TimeZone(identifier: "UTC")!

            // *** Get All components from date ***
            let components = calendar.dateComponents([.hour, .year, .minute], from: newDate ?? date)
            print("All Components : \(components)")

            // *** Get Individual components from date ***
            let hour = calendar.component(.hour, from: newDate ?? date)
            let minutes = calendar.component(.minute, from: newDate ?? date)
            let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
            print("\(hour):\(minutes)")
            
            let result = TimeSlot.init(startsAt: "\(hour):\(minutesString)", isAvailable: timeSlot!.isAvailable)
            return result
        }
        
        
        return EventViewModel(
            startEvent: startEvent,
            endEvent: endEvent,
            description: description,
            bandName: bandName,
            duration: duration,
            timeSlot: timeSlot)
    }
    
    func getEventHoursAndMinutes(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let hour = calendar.component(.hour, from: dateFormatted ?? currentDate)
        let minutes = calendar.component(.minute, from: dateFormatted ?? currentDate)
        let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
        let result = "\(hour):\(minutesString)"
        return result
    }
    
    func getEventDay(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let day = calendar.component(.day, from: dateFormatted ?? currentDate)
        let result = "\(day)"
        return result
    }
    
    func getEventEntireDate(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let month = calendar.component(.month, from: dateFormatted ?? currentDate)
        let monthString = month<10 ? String(format: "%02d", month) : String(month)
        let year = calendar.component(.year, from: dateFormatted ?? currentDate)
        let day = calendar.component(.day, from: dateFormatted ?? currentDate)
        let hour = calendar.component(.hour, from: dateFormatted ?? currentDate)
        let minutes = calendar.component(.minute, from: dateFormatted ?? currentDate)
        let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
        let result = "\(day)/\(monthString)/\(year) at \(hour):\(minutesString)"
        return result
    }
}

struct TimeSlot: Hashable {
    let startsAt: String
    let isAvailable: Bool
}
