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
            .navigationTitle("Interviews")
            .toolbar {
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
        
        if self.interviewsViewModel.isError == true {
            userViewModel.logOut()
        } else {
            debugPrint("load interviews")
            self.interviewsViewModel.interviewsQuery()
        }
        
    }
}

//struct ReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderView()
//    }
//}
