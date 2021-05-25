
import SwiftUI
import KeychainSwift

struct AuthenticationView: View {
    @State private var username = ""
    @State private var password = ""
    @State var signUp = false
    let loginViewModel = LoginViewModel()
    @ObservedObject var user: User
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
            Spacer()
                .frame(height: 50)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
                .overlay(
                    Button(action: {
                        loginViewModel.perfomLoginMutation(username: username, password: password) { token in
                            user.token = token
                        }
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
}

//struct AuthenticationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthenticationView()
//    }
//}
