
import SwiftUI

struct EventAddressView: View {
    @Binding var label: String
    @Binding var street: String
    @Binding var zipCode: String
    @Binding var city: String
    @Binding var country: String

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

//struct EventAdressView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventAddressView(label: "$label", street: "$street", zipCode: "$zipCode", city: "$city", country: "$country")
//    }
//}
