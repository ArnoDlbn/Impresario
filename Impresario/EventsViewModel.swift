
import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [EventViewModel] = []
    
    func performEventsQuery() {
        Network.shared.apollo.fetch(query: EventsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let edges = graphQLResult.data?.events?.edges {
                    var eventViewModels: [EventViewModel] = []
                    for edge in edges {
                        if let e = edge {
                            let eventViewModel = EventViewModel.from(content: e.node)
                            eventViewModels.append(eventViewModel)
                        }
                    }
                    self.events = eventViewModels
                } else {
                    graphQLResult.errors.map { error in
                        print("1" + error.description)
                    }
                }
            case .failure(let error):
                print("2" + error.localizedDescription)
            }
        }
    }
}
