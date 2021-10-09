
import SwiftUI

@main
struct ImpresarioApp: App {
    
    @StateObject var userViewModel = UserViewModel()
    @State private var isAuthenticated = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                MainView()
                    .environmentObject(userViewModel)
            } else {
                StartView()
                    .environmentObject(userViewModel)
                    .onAppear {
                        if userViewModel.user.token != nil {
                            userViewModel.getUser()
                        }
                    }
            }
        }
        .onChange(of: userViewModel.user.email, perform: { email in
            isAuthenticated = (email != nil)
        })
    }
}
