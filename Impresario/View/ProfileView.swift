
import SwiftUI
import KeychainSwift

struct ProfileView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 0) {
                Image("Landscape")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height / 4)
                VStack {
                    Image("Profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.init(.darkGray), lineWidth: 4))
                        .shadow(radius: 7)
                        if let user = userViewModel.user {
                            Text("\(user.firstName)")
                            Text("\(user.firstName)")
                            Text("\(user.email)")
                        }
                }
                .padding(.top, -100)
                .padding(.leading, 20)
                Divider()
                    .padding()
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                    .overlay(Button(action: {
                        let keychain = KeychainSwift()
                        keychain.delete("token")
                        userViewModel.user = nil
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text(" Log out ")
                            .foregroundColor(.white)
                            .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                    }))
                    .padding(.bottom, 10)
            }
            .frame(width: geo.size.width, height: geo.size.height)
//                    .ignoresSafeArea()
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
