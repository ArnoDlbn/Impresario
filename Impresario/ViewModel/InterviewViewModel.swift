
import Foundation

class InterviewViewModel {
    
    var interview: Interview
    
    init(withInterview interview: Interview) {
        self.interview = interview
    }
    
    static func from(content: InterviewsQuery.Data.Interview.Edge.Node) -> Interview {
        
        let startsAt = content.startsAt
        let endsAt = content.endsAt
        let event = EventViewModel.from(content: content.event)
        let id = content.id

        return Interview(startsAt: startsAt, endsAt: endsAt, event: event, id: id)
    }
    
    static func requestInterview(eventId: String, startsAt: String, completion: @escaping () -> ()) {
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
    
    func cancelInterview(interviewId: String, completion: @escaping () -> ()) {
        Network.shared.apollo.perform(mutation: CancelInterviewMutation(input: CanceledInterviewInput(interviewId: interviewId))) { result in
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
