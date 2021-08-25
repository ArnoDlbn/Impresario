//
//  ReminderView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct ReminderView: View {
    
    @ObservedObject var interviewsViewModel = InterviewsViewModel()
    @State private var isViewProfile = false
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List(interviewsViewModel.interviews) { interview in
                NavigationLink(destination: DetailInterviewView(interviewViewModel: InterviewViewModel(withInterview: interview))) {
                    InterviewRowView(interviewViewModel: InterviewViewModel(withInterview: interview))
                }
            }
            .onAppear {
                loadInterviews()
            }
            .navigationBarTitle(Text("Juin"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Reminder")
                        .foregroundColor(Color.init(.darkGray))
                        .font(.custom("Marker Felt Wide", size: 25, relativeTo: .largeTitle))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Label("Profile", systemImage: "person.crop.circle")
                        .onTapGesture {
                            isViewProfile.toggle()
                        }
                        .foregroundColor(Color.init(.darkGray))
                        .font(.system(size: 25))
                }
            }
        }
        .sheet(isPresented: $isViewProfile, content: {
            ProfileView(userViewModel: userViewModel)
        })
    }
    
    func loadInterviews() {
        debugPrint("dismiss")
        self.interviewsViewModel.interviewsQuery()
    }
}

//struct ReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderView()
//    }
//}
