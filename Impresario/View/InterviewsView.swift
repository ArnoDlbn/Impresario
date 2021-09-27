
import SwiftUI

struct InterviewsView: View {
    
    @ObservedObject var interviewsViewModel = InterviewsViewModel()
    @State private var isViewProfile = false
    @ObservedObject var userViewModel: UserViewModel
    
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
        .onAppear {
            debugPrint("On appear Interviews view")
            loadInterviews()
        }
        .sheet(isPresented: $isViewProfile, content: {
            ProfileView(userViewModel: userViewModel)
        })
    }
    
    func loadInterviews() {
        debugPrint("Fetch interviews")
        self.interviewsViewModel.interviewsQuery() {
            self.userViewModel.logOut()
        }
    }
}

//struct ReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderView()
//    }
//}
