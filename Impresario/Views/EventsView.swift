//
//  SwiftUIView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct EventsView: View {
    @State var events: [EventViewModel] = []
    @State private var isAddEvent = false
    @State private var isViewProfile = false
    
    var body: some View {
        NavigationView {
            List(events) { event in
                NavigationLink(destination: Text("Sevdaliza")) {
                    EventRowView(viewModel: event)
                }
            }
            .onAppear {
                ImpresarioQueries.performEventsQuery() { eventViewModels in
                    self.events = eventViewModels
                }
            }
            .navigationTitle(Text("Juin"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Add event")
                        .onTapGesture {
                            isAddEvent.toggle()
                        }
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
        .sheet(isPresented: $isAddEvent, content: {
            AddEventView()
        })
        .sheet(isPresented: $isViewProfile, content: {
            ProfileView()
        })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
