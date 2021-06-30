//
//  ReminderView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct ReminderView: View {
    let coloredNavAppearance = UINavigationBarAppearance()

    init(){
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemGray4
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 15)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 25)!]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        NavigationView {
            List(0 ..< 3) { item in
                NavigationLink(destination: Text("Sevdaliza")) {
                    EventRowView(viewModel: EventViewModel(startEvent: "23/05", endEvent: "24/05", description: "Promo radio", bandName: "Sevdaliza"))
                }
            }
            .navigationBarTitle(Text("Juin"))
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
