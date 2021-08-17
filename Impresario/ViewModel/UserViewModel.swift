
import Foundation
import KeychainSwift

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    func perfomLoginMutation(username: String, password: String) {
        Network.shared.apollo.perform(mutation: LoginMutation(input: Credentials(email: username, password: password))) { result in
            let keyChain = KeychainSwift()
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.login.token {
                    keyChain.set(result, forKey: "token")
                    self.getUserInfo()
                    print(keyChain.get("token")!)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    keyChain.delete("token")
                }
            case .failure:
                keyChain.delete("token")
            }
        }
    }
    
    func getUserInfo() {
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.me {
                    print("Get user info")
                    self.user = User(email: result.email,
                                     firstName: result.firstName,
                                     lastName: result.lastName,
                                     isJournalist: result.isJournalist,
                                     isArtist: result.isArtist)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
