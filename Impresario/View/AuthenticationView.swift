
import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    
    @State private var username = "impresarioapp+louislepron@gmail.com"
    @State private var password = "Konbini!"
    
    @State var signUp = false
    @State var showAlertFailure = false
    @State var showAlertNoBiometry = false
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
                .alert(isPresented: $showAlertFailure, content: {
                    AlertViewer.showAlertWithActions(message: "Authentication failed!") {
                        userViewModel.login(username: username, password: password)
                    }
                })
            Spacer()
                .frame(height: 30)
//                .alert(isPresented: $showAlertNoBiometry, content: {
//                    AlertViewer.showAlertWithActions(message: "Your device is not configured for biometric authentication.") {
//                        userViewModel.login(username: username, password: password)
//                    }
//                })
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
                        userViewModel.login(username: username, password: password)
                    } else {
                        showAlertFailure.toggle()
                    }
                }
            }
        } else {
            showAlertNoBiometry.toggle()
            userViewModel.login(username: username, password: password)
        }
    }
}
