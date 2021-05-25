
import SwiftUI

struct StartView: View {
    @State private var signUp = false
    @State private var buttonSignUpText = " Sign up "
    @ObservedObject var user: User
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("IMPRESARIO")
                        .font(.custom("Marker Felt Wide", size: 30, relativeTo: .largeTitle))
                        .foregroundColor(Color.init(.darkGray))
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.init(.darkGray), lineWidth: 2)
                        .frame(width: 70, height: 25, alignment: .center)
                        .overlay(Button(action: {
                            signUp.toggle()
                            if signUp {
                                buttonSignUpText = " Sign In "
                            } else {
                                buttonSignUpText = " Sign Up "
                            }
                        }, label: {
                            Text(self.buttonSignUpText)
                                .foregroundColor(Color.init(.darkGray))
                                .font(.custom("Marker Felt", size: 20, relativeTo: .largeTitle))
                        }))
                }
                .padding(.leading)
                .padding(.trailing)
                
                if signUp {
                    RegisterView()
                } else {
                    AuthenticationView(user: user)
                }
            }
        }
    }
}

//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//    }
//}
