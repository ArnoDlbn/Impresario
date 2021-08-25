
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
            let result = TimeSlot.init(startsAt: timeSlot!.startsAt, isAvailable: timeSlot!.isAvailable)
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
    
    func cancelEvent(eventId: String) {
        Network.shared.apollo.perform(mutation: CancelEventMutation(input: CanceledEventInput(eventId: eventId))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
            //                completion()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
