
import Foundation

class InterviewsViewModel: ObservableObject {
    
    @Published var interviews: [Interview] = []
    @Published var isError: Bool = false
    
    func interviewsQuery() {
        Network.shared.apollo.fetch(query: InterviewsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let edges = graphQLResult.data?.interviews?.edges {
                    var interviews: [Interview] = []
                    for edge in edges {
                        if let e = edge {
                            let interview = InterviewViewModel.from(content: e.node)
                            interviews.append(interview)
                        }
                    }
                    print(interviews.count)
                    self.interviews = interviews
                } else {
                    print(graphQLResult.errors.debugDescription)
                    print(graphQLResult.errors?.description ?? "rien")
                    graphQLResult.errors.map { error in
                        print("1")
                        print(error.description)
                    }
                }
            case .failure(let error):
                print("2")
                print(error.localizedDescription)
                self.isError = true
            }
        }
    }
}
