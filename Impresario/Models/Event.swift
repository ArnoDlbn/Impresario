
import Foundation

struct Event: Identifiable, Decodable {
    
    let startsAt: String?
    let endsAt: String?
    let title: String?
    let description: String?
    let bandName: String?
    let duration: Int?
    let timeSlot: [TimeSlot]?
    let id: String
    let physicalAddress: PhysicalAddress?
    let virtualAddress: VirtualAddress?
    
    init(startsAt: String? = nil,
         endsAt: String? = nil,
         title: String? = nil,
         description: String? = nil,
         bandName: String? = nil,
         duration: Int? = nil,
         timeSlot: [TimeSlot]? = nil,
         id: String,
         physicalAddress: PhysicalAddress? = nil,
         virtualAddress: VirtualAddress? = nil) {
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.title = title
        self.description = description
        self.bandName = bandName
        self.duration = duration
        self.timeSlot = timeSlot
        self.id = id
        self.physicalAddress = physicalAddress
        self.virtualAddress = virtualAddress
    }
}
