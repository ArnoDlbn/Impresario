
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Prénom")
            Text("Nom")
            Text("Email")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
