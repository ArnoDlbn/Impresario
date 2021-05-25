
import SwiftUI
import KeychainSwift

@main
struct ImpresarioApp: App {
    @StateObject var user = User()
    let keychain: KeychainSwift

    
    init() {
        keychain = KeychainSwift()
        keychain.delete("token")
    }
    
    var body: some Scene {
        WindowGroup {
            
            if keychain.get("token") != nil {
                MainView()
            } else {
                StartView(user: user)
            }
        }
    }
}
