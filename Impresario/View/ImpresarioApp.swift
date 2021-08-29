
import SwiftUI
import KeychainSwift

@main
struct ImpresarioApp: App {
    
    let keychain: KeychainSwift
    
    @ObservedObject var userViewModel = UserViewModel()
    @Environment(\.scenePhase) var scenePhase
    
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
        /*
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                userViewModel.getUserInfo() {
                    debugPrint("Get user info from ImpresarioApp")
                }
            }
        }
        */
    }
}
