
import Foundation
import Apollo
import KeychainSwift

class TokenAddingInterceptor: ApolloInterceptor {
    let keychain: KeychainSwift
    
    init() {
        keychain = KeychainSwift()
    }
    
    enum UserError: Error {
        case noUserLoggedIn
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        if request.operation.operationName != "login" {
            guard let token = keychain.get("token") else {
                chain.handleErrorAsync(UserError.noUserLoggedIn,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
