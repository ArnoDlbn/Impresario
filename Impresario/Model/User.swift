
import Foundation
import KeychainSwift

struct User: Decodable {
    
    var email: String?
    var firstName: String?
    var lastName: String?
    var isJournalist: Bool
    var isArtist: Bool
    
    init() {
        email = nil
        firstName = nil
        lastName = nil
        isArtist = false
        isJournalist = false
    }
    
    var token: String? {
        get {
            let keychain = KeychainSwift()
            return keychain.get("token")
        }
        set (newToken) {
            let keychain = KeychainSwift()
            if newToken == nil {
                keychain.delete("token")
                email = nil
                firstName = nil
                lastName = nil
                isArtist = false
                isJournalist = false
            } else {
                keychain.set(newToken!, forKey: "token")
            }
        }
    }
}
