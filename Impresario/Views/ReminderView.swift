//
//  ReminderView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct ReminderView: View {
    @ObservedObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            List(eventsViewModel.events) { event in
                NavigationLink(destination: Text("Sevdaliza")) {
                    EventRowView(viewModel: event)
                }
            }
            .onAppear {
                loadEvents()
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
//                            isViewProfile.toggle()
                        }
                        .foregroundColor(Color.init(.darkGray))
                        .font(.system(size: 25))
                }
            }
        }
    }
    
    func loadEvents() {
        debugPrint("dismiss")
        self.eventsViewModel.performEventsQuery()
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
