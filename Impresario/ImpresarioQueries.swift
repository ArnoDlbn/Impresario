
import Foundation
import Apollo

class ImpresarioQueries {
    
    static func performEventsQuery(completion: @escaping ([EventViewModel]) -> Void) {
        Network.shared.apollo.fetch(query: EventsQuery()) { result in
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
                    completion(eventViewModels)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
