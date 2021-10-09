
import SwiftUI

struct InterviewsView: View {
    
    @EnvironmentObject var interviewsViewModel: InterviewsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var isViewProfile = false
    
    var body: some View {
        NavigationView {
            List(interviewsViewModel.interviews) { interview in
                NavigationLink(destination: InterviewDetailView(interviewViewModel: InterviewViewModel(withInterview: interview))) {
                    InterviewRowView(interviewViewModel: InterviewViewModel(withInterview: interview))
                }
            }
            .padding(.leading, -20)
            .listStyle(PlainListStyle())
            .navigationTitle("Interviews")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isViewProfile.toggle()
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        }
        .sheet(isPresented: $isViewProfile, content: {
            ProfileView()
        })
        .onAppear {
            debugPrint("On appear Interviews view")
            loadInterviews()
        }
    }
    
    func loadInterviews() {
        debugPrint("Fetch interviews")
        interviewsViewModel.getInterviews {
            userViewModel.logOut()
        }
    }
}
