
import Foundation

class InterviewsViewModel: ObservableObject {
    
    @Published var interviews: [Interview] = []
    
    func getInterviews(errorHandler: @escaping () -> ()) {
        APIManager.shared.getInterviews(
            successHandler: { interviews in
                self.interviews.removeAll()
                self.interviews = interviews
            },
            errorHandler: errorHandler
        )
    }
}
