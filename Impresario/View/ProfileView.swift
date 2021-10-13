
import SwiftUI
import KeychainSwift

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var isLoggedOut = false
    @State private var showingAlert = false
    
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
                        .overlay(Circle().stroke(Color(red: 255/255, green: 203/255, blue: 164/255), lineWidth: 4))
                        .shadow(radius: 7)
                    Text(userViewModel.user.firstName ?? "")
                    + Text("  ") + Text(userViewModel.user.lastName ?? "")
                    Text(userViewModel.user.email ?? "")
                }
                .padding(.top, -100)
                .padding(.leading, 20)
                Divider()
                    .padding()
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .frame(width: 220, height: 40, alignment: .center)
                    .overlay(Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Text(" Log out ")
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                    }))
                    .padding(.bottom, 10)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .alert(isPresented: $showingAlert) {
                AlertViewer.showAlertWithActions(message: "Are you sure you want to log out?") {
                    isLoggedOut.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .onDisappear {
                if isLoggedOut {
                    userViewModel.user.token = nil
                }
            }
        }
    }
}
