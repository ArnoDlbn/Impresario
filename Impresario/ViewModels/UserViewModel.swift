
import Foundation
import KeychainSwift

class UserViewModel: ObservableObject {
    
    @Published var user: User = User()
    
    func login(email: String, password: String) {
        APIManager.shared.login(
            email: email,
            password: password,
            successHandler: { token in
                self.user.token = token
            },
            errorHandler: {
                self.user.token = nil
            }
        )
    }
    
    func getUser() {
        APIManager.shared.getUser(
            successHandler: { user in
                self.user.email = user.email
                self.user.firstName = user.firstName
                self.user.lastName = user.lastName
                self.user.isArtist = user.isArtist
                self.user.isJournalist = user.isJournalist
            },
            errorHandler: {
                self.user.token = nil
            }
        )
    }
    
    func logOut() {
        self.user.token = nil
    }
}
