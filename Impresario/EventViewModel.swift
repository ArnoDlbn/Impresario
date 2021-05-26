
import Foundation
import Apollo

class EventViewModel: Codable, Identifiable {
    
    let startEvent: String
    let endEvent: String
    let description: String?
    let bandName: String
    
    init(startEvent: String, endEvent: String, description: String?, bandName: String) {
        self.startEvent = startEvent
        self.endEvent = endEvent
        self.description = description
        self.bandName = bandName
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

        return EventViewModel(
            startEvent: startEvent,
            endEvent: endEvent,
            description: description,
            bandName: bandName)
    }
}
