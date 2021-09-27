
import Foundation
import KeychainSwift

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    let keyChain = KeychainSwift()
    
    func login(username: String, password: String) {
        Network.shared.apollo.perform(mutation: LoginMutation(input: Credentials(email: username, password: password))) { result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.login.token {
                    self.keyChain.set(result, forKey: "token")
                    self.getUserInfo() {
                        print("Get user info from login")
                    }
                    print(self.keyChain.get("token")!)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    self.keyChain.delete("token")
                }
            case .failure:
                self.logOut()
            }
        }
    }
    
    func getUserInfo(completion: @escaping () -> ()) {
        Network.shared.apollo.fetch(query: MeQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.me {
                    
                    self.user = User(email: result.email,
                                     firstName: result.firstName,
                                     lastName: result.lastName,
                                     isJournalist: result.isJournalist,
                                     isArtist: result.isArtist)
                    completion()
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    self.user = nil
                }
            case .failure(let error):
                print(error)
                self.logOut()
            }
        }
    }
    
    func logOut() {
        self.keyChain.delete("token")
        self.user = nil
    }
}
