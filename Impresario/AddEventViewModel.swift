
import Foundation

class AddEventViewModel {

    func performEventInput(description: String, endsAt: String, startsAt: String, title: String, completion: @escaping () -> Void) {
        Network.shared.apollo.perform(mutation: CreateEventMutation(input: EventInput(description: description, endsAt: endsAt, startsAt: startsAt, title: title))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data!)
                completion()
            case .failure(let error):
            debugPrint(error)
            }
        }
    }
}
