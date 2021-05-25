
import Foundation
import KeychainSwift

class LoginViewModel: ObservableObject {
    @Published var token: String? = nil
    
    func perfomLoginMutation(username: String, password: String, completion: @escaping (String?) -> Void) {
        Network.shared.apollo.perform(mutation: LoginMutation(input: Credentials(email: username, password: password))) { result in
            let keyChain = KeychainSwift()
            switch result {
            case .success(let graphQLResult):
                
                if let result = graphQLResult.data?.login?.token {
                    keyChain.set(result, forKey: "token")
                    completion(result)
                    print(keyChain.get("token")!)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    completion(nil)
                    keyChain.delete("token")
                }
            case .failure:
                
                completion(nil)
                keyChain.delete("token")
            }
        }
    }
    
    func performMeQuery() {
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            switch result {
            case .success:
                return
            case .failure:
                self.token = nil
            }
        }
        
    }
}

class User: ObservableObject {
    @Published var token: String? = nil
}
