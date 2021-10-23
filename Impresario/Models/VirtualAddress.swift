
import Foundation

struct VirtualAddress: Decodable {
    
    let label: String?
    let url: String
    
    init(label: String? = nil,
         url: String) {
        self.label = label
        self.url = url
    }
}
