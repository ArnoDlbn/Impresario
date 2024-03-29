
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
                .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            }
            .pickerStyle(.segmented)
            .frame(width: 220)
            Spacer()
                .frame(height: 50)
            VStack(spacing: 10) {
                TextField("Full name", text: $fullName)
                TextField("Email", text: $email)
                TextField("Password", text: $password)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            .frame(width: 220)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(Button(action: {
                }, label: {
                    Text(" create your account ")
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                }))
            Spacer()
        }
        .padding()
    }
}
