
import SwiftUI

struct StartView: View {
    
    @State private var signUp = false
    @State private var buttonSignUpText = " sign up "
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("impresario")
                        .font(.custom("KoHo-SemiBold", size: 35, relativeTo: .largeTitle))
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    Spacer()
                    RoundedRectangle(cornerRadius: 17.5)
                        .stroke(Color(red: 255/255, green: 203/255, blue: 164/255), lineWidth: 2)
                        .frame(width: 70, height: 35, alignment: .center)
                        .overlay(Button(action: {
                            signUp.toggle()
                            if signUp {
                                buttonSignUpText = " sign in "
                            } else {
                                buttonSignUpText = " sign up "
                            }
                        }, label: {
                            Text(self.buttonSignUpText)
                                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                        }))
                }
                .padding(.leading)
                .padding(.trailing)
                
                if signUp {
                    RegisterView()
                } else {
                    AuthenticationView(userViewModel: userViewModel)
                }
            }
        }
    }
}
