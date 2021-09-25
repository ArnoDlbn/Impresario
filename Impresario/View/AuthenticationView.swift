
import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    
    @State private var username = "contact+louislepron@appsolument.com"
    @State private var password = "Konbini!"
    
    @State var signUp = false
    @State var showAlertFailure = false
    @State var showAlertNoBiometry = false
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                TextField("Username", text: $username)
                    .textContentType(.username)
                SecureField("Password", text: $password)
                    .textContentType(.password)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            .frame(width: 220, height: 40, alignment: .center)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(
                    Button(action: {
                        authenticateTapped()
                    }, label: {
                        Text(" sign In ")
                            .foregroundColor(.white)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                    })
                )
                .alert(isPresented: $showAlertFailure, content: {
                    AlertViewer.showAlertWithActions(message: "Authentication failed!") {
                        userViewModel.login(username: username, password: password)
                    }
                })
//            Spacer()
//                .frame(height: 30)
            //                .alert(isPresented: $showAlertNoBiometry, content: {
            //                    AlertViewer.showAlertWithActions(message: "Your device is not configured for biometric authentication.") {
            //                        userViewModel.login(username: username, password: password)
            //                    }
            //                })
            //            Text("Forgot password ?")
            //                .foregroundColor(Color.init(.darkGray))
            //                .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
            Spacer()
        }
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
