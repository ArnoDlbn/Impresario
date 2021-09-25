
import SwiftUI
import KeychainSwift

@main
struct ImpresarioApp: App {
    
    let keychain: KeychainSwift
    
    @ObservedObject var userViewModel = UserViewModel()
    
    init() {
        debugPrint("Get keychain")
        keychain = KeychainSwift()
    }
    
    var body: some Scene {
        WindowGroup {
            if keychain.get("token") != nil {
                MainView(with: userViewModel)
            } else {
                StartView(userViewModel: userViewModel)
            }
        }
    }
}
