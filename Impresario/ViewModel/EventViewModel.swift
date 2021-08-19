
import Foundation

class EventViewModel: Identifiable {
    
    var event: Event
    
    init(withEvent event: Event) {
        self.event = event
    }
    
    static func from(content: EventsQuery.Data.Event.Edge.Node) -> Event {
        let id = content.id
        let startEvent = content.startsAt
        let endEvent = content.endsAt
        let description = content.description
        let bandName = content.band.name
        let duration = content.interviewDuration
        let timeSlot: [TimeSlot] = content.timeSlots!.map { timeSlot in
            let date = Date()
            let dateForm = ISO8601DateFormatter()
            dateForm.timeZone = TimeZone.current
            let newDate = dateForm.date(from: timeSlot!.startsAt)
//            let dateFormatter = DateFormatter()
//            let newDate = dateFormatter.date(from: timeSlot!.startsAt)""

            // *** create calendar object ***
            var calendar = Calendar.current

            // *** define calendar components to use as well Timezone to UTC ***
            calendar.timeZone = TimeZone(identifier: "UTC")!

            // *** Get Individual components from date ***
            let hour = calendar.component(.hour, from: newDate ?? date)
            let minutes = calendar.component(.minute, from: newDate ?? date)
            let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
            
            let result = TimeSlot.init(startsAt: "\(hour):\(minutesString)", isAvailable: timeSlot!.isAvailable, rawStartsAt: timeSlot!.startsAt)
            return result
        }
//        let address = Address(label: content.physicalAddress?.label, street: content.physicalAddress?.street, zipCode: content.physicalAddress?.zipCode, city: content.physicalAddress?.city)
        
        return Event(
            startEvent: startEvent,
            endEvent: endEvent,
            description: description,
            bandName: bandName,
            duration: duration,
            timeSlot: timeSlot,
            id: id
//            address: address
        )
    }
    
    static func from(content: InterviewsQuery.Data.Interview.Edge.Node.Event) -> Event {
        let description = content.description
        let bandName = content.band.name
        let address = Address(label: content.physicalAddress?.label, street: content.physicalAddress?.street, zipCode: content.physicalAddress?.zipCode, city: content.physicalAddress?.city)
        let id = content.id
        
        return Event(
            description: description,
            bandName: bandName,
            id: id,
            address: address)
    }
    
    static func createEvent(description: String, endsAt: String, startsAt: String, title: String, completion: @escaping () -> Void) {
        Network.shared.apollo.perform(mutation: CreateEventMutation(input: EventInput(description: description, endsAt: endsAt, startsAt: startsAt, title: title))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
                completion()
            case .failure(let error):
            debugPrint(error)
            }
        }
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
