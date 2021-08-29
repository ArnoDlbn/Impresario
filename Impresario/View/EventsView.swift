//
//  SwiftUIView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()
    @State private var isAddEvent = false
    @State private var isViewProfile = false
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List(eventsViewModel.events) { event in
                NavigationLink(destination: DetailEventView(eventViewModel: EventViewModel(withEvent: event), userViewModel: userViewModel)) {
                    EventRowView(eventViewModel: EventViewModel(withEvent: event))
                }
            }
            .navigationTitle("Events")
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
            //            RoundedRectangle(cornerRadius: 10)
            //                .foregroundColor(Color.init(.darkGray))
            //                .frame(width: 100, height: 40, alignment: .center)
            //                .overlay(Text(" Add event ")
            //                            .foregroundColor(.white)
            //                            .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
            //                )
            //                .onTapGesture {
            //                    isAddEvent.toggle()
            //                }
            //                .padding(.bottom, 10)
        }
        .onAppear {
            loadEvents()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isAddEvent, onDismiss: loadEvents, content: {
            AddEventView()
        })
        .sheet(isPresented: $isViewProfile, content: {
            ProfileView(userViewModel: userViewModel)
        })
    }
    
    func loadEvents() {
        debugPrint("Load events")
        self.eventsViewModel.eventsQuery() {
            self.userViewModel.logOut()
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsView()
//    }
//}
