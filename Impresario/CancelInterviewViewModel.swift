
import Foundation

class CancelInterviewViewModel {
    
    static func cancelInterview(interviewId: String) {
        Network.shared.apollo.perform(mutation: CancelInterviewMutation(input: CanceledInterviewInput(interviewId: interviewId))) { result in
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
