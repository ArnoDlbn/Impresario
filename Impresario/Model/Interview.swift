
import Foundation

struct Interview: Identifiable {
        
    let startsAt: String
    let endsAt: String
    let event: EventViewModel
    let id: String
    
    init(startsAt: String, endsAt: String, event: EventViewModel, id: String) {
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.event = event
        self.id = id
    }
}