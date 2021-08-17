
import Foundation

class EventViewModel: Identifiable {
    
    let startEvent: String?
    let endEvent: String?
    let description: String?
    let bandName: String?
    let duration: Int?
    let timeSlot: [TimeSlot]?
    let eventId: String
    let address: Address?
    
    init(startEvent: String? = nil,
         endEvent: String? = nil,
         description: String? = nil,
         bandName: String? = nil,
         duration: Int? = nil,
         timeSlot: [TimeSlot]? = nil,
         eventId: String,
         address: Address? = nil) {
        
        self.startEvent = startEvent
        self.endEvent = endEvent
        self.description = description
        self.bandName = bandName
        self.duration = duration
        self.timeSlot = timeSlot
        self.eventId = eventId
        self.address = address
    }

    static func from(content: EventsQuery.Data.Event.Edge.Node) -> EventViewModel {
        let eventId = content.id
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
        
        return EventViewModel(
            startEvent: startEvent,
            endEvent: endEvent,
            description: description,
            bandName: bandName,
            duration: duration,
            timeSlot: timeSlot,
            eventId: eventId
//            address: address
        )
    }
    
    static func from(content: InterviewsQuery.Data.Interview.Edge.Node.Event) -> EventViewModel {
        let description = content.description
        let bandName = content.band.name
        let address = Address(label: content.physicalAddress?.label, street: content.physicalAddress?.street, zipCode: content.physicalAddress?.zipCode, city: content.physicalAddress?.city)
        let eventId = content.id
        
        return EventViewModel(
            description: description,
            bandName: bandName,
            eventId: eventId,
            address: address)
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
    let rawStartsAt: String
}

struct Address {
    let label: String?
    let street: String?
    let zipCode: String?
    let city: String?
    let country: String?
    let countryCode: String?
    
    init(label: String? = nil,
        street: String? = nil,
        zipCode: String? = nil,
        city: String? = nil,
        country: String? = nil,
        countryCode: String? = nil) {
        
        self.label = label
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.country = country
        self.countryCode = countryCode
    }
}
