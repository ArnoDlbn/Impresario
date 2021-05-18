//
//  ReminderView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 3) { item in
                NavigationLink(destination: Text("Sevdaliza")) {
                    EventRowView()
                }
            }
            .navigationBarTitle(Text("Juin")
                                .foregroundColor(Color.init(.darkGray))
                                .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle)))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Reminder")
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

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
