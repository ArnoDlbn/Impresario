
import SwiftUI
import KeychainSwift

@main
struct ImpresarioApp: App {
    @ObservedObject var userViewModel = UserViewModel()

    let keychain: KeychainSwift

    
    init() {
        keychain = KeychainSwift()
//        keychain.delete("token")
    }
    
    var body: some Scene {
        WindowGroup {
            
            if keychain.get("token") != nil {
                MainView(userViewModel: userViewModel)
            } else {
                StartView(userViewModel: userViewModel)
            }
        }
    }
}
