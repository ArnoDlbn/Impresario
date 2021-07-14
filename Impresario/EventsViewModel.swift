
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
                            let eventViewModel = EventViewModel.from(edge: e)
                            eventViewModels.append(eventViewModel)
                        }
                    }
                    self.events = eventViewModels
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
