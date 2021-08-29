
import SwiftUI
import KeychainSwift

@main
struct ImpresarioApp: App {
    
    let keychain: KeychainSwift
    
    @ObservedObject var userViewModel = UserViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    init() {
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
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                userViewModel.getUserInfo() {
                    print("ImpresarioApp")
                }
            }
        }
    }
}
