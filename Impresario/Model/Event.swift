
import Foundation

struct Event: Identifiable {
    
    let startEvent: String?
    let endEvent: String?
    let description: String?
    let bandName: String?
    let duration: Int?
    let timeSlot: [TimeSlot]?
    let id: String
    let address: Address?
    
    init(startEvent: String? = nil,
         endEvent: String? = nil,
         description: String? = nil,
         bandName: String? = nil,
         duration: Int? = nil,
         timeSlot: [TimeSlot]? = nil,
         id: String,
         address: Address? = nil) {
        
        self.startEvent = startEvent
        self.endEvent = endEvent
        self.description = description
        self.bandName = bandName
        self.duration = duration
        self.timeSlot = timeSlot
        self.id = id
        self.address = address
    }
}
