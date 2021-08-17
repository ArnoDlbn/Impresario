
import Foundation

class AddEventViewModel {

    func createEvent(description: String, endsAt: String, startsAt: String, title: String, completion: @escaping () -> Void) {
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
}
