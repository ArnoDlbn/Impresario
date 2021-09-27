
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
        let title = content.title
        let description = content.description
        let bandName = content.band.name
        let duration = content.interviewDuration
        let timeSlot: [TimeSlot] = content.timeSlots!.map { timeSlot in
            let result = TimeSlot.init(startsAt: timeSlot!.startsAt, isAvailable: timeSlot!.isAvailable)
            return result
        }
        
        let firstAddress: PhysicalAddress?
        if let physicalAddress = content.physicalAddress {
            firstAddress = PhysicalAddress(label: physicalAddress.label, street: physicalAddress.street, zipCode: physicalAddress.zipCode, city: physicalAddress.city, countryCode: physicalAddress.countryCode)
        } else {
            firstAddress = nil
        }
        
        let secondAddress: VirtualAddress?
        if let virtualAddress = content.virtualAddress {
            secondAddress = VirtualAddress(label: virtualAddress.label, url: virtualAddress.url)
        } else {
            secondAddress = nil
        }
        
        let address = Address(physicalAddress: firstAddress, virtualAddress: secondAddress)
        
        return Event(
            startEvent: startEvent,
            endEvent: endEvent,
            title: title,
            description: description,
            bandName: bandName,
            duration: duration,
            timeSlot: timeSlot,
            id: id,
            address: address
        )
    }
    
    static func from(content: InterviewsQuery.Data.Interview.Edge.Node.Event) -> Event {
        let title = content.title
        let description = content.description
        let bandName = content.band.name
        let duration = content.interviewDuration
        let id = content.id
        
        let firstAddress: PhysicalAddress?
        if let physicalAddress = content.physicalAddress {
            firstAddress = PhysicalAddress(label: physicalAddress.label, street: physicalAddress.street, zipCode: physicalAddress.zipCode, city: physicalAddress.city, countryCode: physicalAddress.countryCode)
        } else {
            firstAddress = nil
        }
        
        let secondAddress: VirtualAddress?
        if let virtualAddress = content.virtualAddress {
            secondAddress = VirtualAddress(label: virtualAddress.label, url: virtualAddress.url)
        } else {
            secondAddress = nil
        }
        
        let address = Address(physicalAddress: firstAddress, virtualAddress: secondAddress)
        
        return Event(
            title: title,
            description: description,
            bandName: bandName,
            duration: duration,
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
