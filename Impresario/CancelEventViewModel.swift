
import Foundation

class CancelEventViewModel {
    
    static func cancelEvent(eventId: String) {
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
