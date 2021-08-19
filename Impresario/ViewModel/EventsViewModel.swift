
import Foundation

class EventsViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    
    func eventsQuery() {
        Network.shared.apollo.fetch(query: EventsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let edges = graphQLResult.data?.events?.edges {
                    var events: [Event] = []
                    for edge in edges {
                        if let e = edge {
                            let event = EventViewModel.from(content: e.node)
                            events.append(event)
                        }
                    }
                    self.events = events
                } else {
                    print(graphQLResult.errors.debugDescription)
                    print(graphQLResult.errors?.description ?? "rien")
                    graphQLResult.errors.map { error in
                        print("1")
                        print(error.description)
                    }
                }
            case .failure(let error):
                print("2")
                print(error.localizedDescription)
            }
        }
    }
}
