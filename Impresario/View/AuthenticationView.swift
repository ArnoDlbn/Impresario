
import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var email = "contact+juliebudet@appsolument.com"
    @State private var password = "Yelle!"
    
    @State var signUp = false
    @State var showAlertFailure = false
    @State var showAlertNoBiometry = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                SecureField("Password", text: $password)
                    .textContentType(.password)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            .frame(width: 220)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(
                    Button(action: {
                        authenticateTapped()
                    }, label: {
                        Text(" sign In ")
                            .foregroundColor(.white)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                            .frame(width: 200)
                    })
                        .disabled(email.isEmpty || password.isEmpty)
                )
                .alert(isPresented: $showAlertFailure, content: {
                    AlertViewer.showAlertWithActions(message: "Authentication failed!") {
                        userViewModel.login(email: email, password: password)
                    }
                })
            //            Spacer()
            //                .frame(height: 30)
            //                .alert(isPresented: $showAlertNoBiometry, content: {
            //                    AlertViewer.showAlertWithActions(message: "Your device is not configured for biometric authentication.") {
            //                        userViewModel.login(username: username, password: password)
            //                    }
            //                })
            Spacer()
        }.onChange(of: userViewModel.user.token) { newToken in
            if (newToken != nil) {
                userViewModel.getUser()
            }
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
                        userViewModel.login(email: email, password: password)
                    } else {
                        showAlertFailure.toggle()
                    }
                }
            }
        } else {
            showAlertNoBiometry.toggle()
            userViewModel.login(email: email, password: password)
        }
    }
}
