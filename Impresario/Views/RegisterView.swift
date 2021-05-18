
import SwiftUI

struct RegisterView: View {
    var profiles = ["Artist", "Journalist"]
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var profile = ""

    var body: some View {
        VStack {
            Spacer()
            Picker("Select a profile", selection: $profile) {
                ForEach(profiles, id: \.self) {
                    Text($0)
                }
            }
            TextField("Full name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
                .overlay(Button(action: {
                }, label: {
                    Text(" Create your account ")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                }))
            Spacer()
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
