
import Foundation

class InterviewViewModel {
    
    var interview: Interview
    
    init(withInterview interview: Interview) {
        self.interview = interview
    }
    
    static func requestInterview(eventId: String, startsAt: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        APIManager.shared.requestInterview(
            eventId: eventId,
            startsAt: startsAt,
            successHandler: successHandler,
            errorHandler: errorHandler
        )
    }
    
    func cancelInterview(interviewId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        APIManager.shared.cancelInterview(
            interviewId: interviewId,
            successHandler: successHandler,
            errorHandler: errorHandler
        )
    }
}
