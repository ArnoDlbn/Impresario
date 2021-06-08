
import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height / 4)
                VStack {
                    Image("Profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.init(.darkGray), lineWidth: 4))
                        .shadow(radius: 7)
                    Text("Prénom")
                    Text("Nom")
                    Text("Email")
                }
                .padding(.top, -100)
                .padding(.leading, 20)
                Divider()
                    .padding()
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
//                    .ignoresSafeArea()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
