
import Foundation

class AddInterviewViewModel {
    
    func requestInterview(eventId: String, startsAt: String, completion: @escaping () -> Void) {
        Network.shared.apollo.perform(mutation: RequestInterviewMutation(input: InterviewRequestInput(eventId: eventId, startsAt: startsAt))) { result in
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
