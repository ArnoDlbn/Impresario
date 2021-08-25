//
//  EventAdressView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 26/06/2021.
//

import SwiftUI

struct EventAddressView: View {
    @State var label = ""
    @State var street = ""
    @State var zipCode = ""
    @State var city = ""
    @State var country = ""
    @State private var isAddAddress = false

    var body: some View {
        VStack {
            TextField("Event Address Label", text: $label)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Event Address Street", text: $street)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Event Address Zip Code", text: $zipCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Event Address City", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Event Address Country", text: $country)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
        }
    }
}

struct EventAdressView_Previews: PreviewProvider {
    static var previews: some View {
        EventAdressView()
    }
}
