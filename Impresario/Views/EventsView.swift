//
//  SwiftUIView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct EventsView: View {
    @State var events: [EventViewModel] = []
    
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
            .navigationTitle(Text("Juin")
                                .foregroundColor(Color.init(.darkGray))
                                .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle)))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Add event")
                        .foregroundColor(Color.init(.darkGray))
                        .font(.custom("Marker Felt Wide", size: 25, relativeTo: .largeTitle))
//                        .overlay()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Label("Profile", systemImage: "person.crop.circle")
                        .foregroundColor(Color.init(.darkGray))
                        .font(.system(size: 25))
//                        .overlay()
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
