//
//  SwiftUIView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 4) { item in
                NavigationLink(destination: Text("Sevdaliza")) {
                    
                    EventRowView()
                }
            }
            .navigationTitle(Text("Juin")
                                .foregroundColor(Color.init(.darkGray))
                                .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle)))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Events")
                        .foregroundColor(Color.init(.darkGray))
                        .font(.custom("Marker Felt Wide", size: 30, relativeTo: .largeTitle))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Label("Profile", systemImage: "person.crop.circle")
                        .foregroundColor(Color.init(.darkGray))
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
