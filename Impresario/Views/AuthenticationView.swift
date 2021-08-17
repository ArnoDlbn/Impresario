
import SwiftUI
import LocalAuthentication
//import KeychainSwift

struct AuthenticationView: View {
    @State private var username = "impresarioapp+sevdaalizadeh@gmail.com"
    @State private var password = "Sevdaliza!"
    @State var signUp = false
    @State var showAlert = false
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.username)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
                .overlay(
                    Button(action: {
                        authenticateTapped()
                    }, label: {
                        Text(" Sign In ")
                            .foregroundColor(.white)
                            .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                    })
                )
            Spacer()
                .frame(height: 30)
            Text("Forgot password ?")
                .foregroundColor(Color.init(.darkGray))
                .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
            Spacer()
        }
        .padding()
    }
    
    func authenticateTapped() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself with TouchID!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                DispatchQueue.main.async {
                    if success {
//                        showAlert.toggle()
//                        self.alert(isPresented: $showAlert, content: {
                            Alert(title: Text("Important message"), message: Text("Authentication is a success !"), dismissButton: .default(Text("Got it!")))
//                        })
                        userViewModel.perfomLoginMutation(username: username, password: password)
                    } else {
//                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
//                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        showAlert.toggle()
                        self.alert(isPresented: $showAlert, content: {
                            Alert(title: Text("Important message"), message: Text("Authentication failed !"), dismissButton: .default(Text("Got it!")))
                        })
                    }
                }
            }
        } else {
            self.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Biometry unavailable"), message: Text("Your device is not configured for biometric authentication."), dismissButton: .default(Text("Got it!")))
            })
            userViewModel.perfomLoginMutation(username: username, password: password)
        }
    }
}

//struct AuthenticationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationView()
//    }
//}
