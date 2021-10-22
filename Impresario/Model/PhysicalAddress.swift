
import Foundation

struct PhysicalAddress: Decodable {
    
    let label: String?
    let street: String
    let zipCode: String
    let city: String
    let countryCode: String?
    
    init(label: String? = nil,
         street: String,
         zipCode: String,
         city: String,
         countryCode: String? = nil) {
        self.label = label
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.countryCode = countryCode
    }
    
    var fullAddress : String? {
        if let label = self.label {
            return "\(label) \n\(self.street) \n\(self.zipCode) \(self.city)"
        } else {
            return "\(self.street) \n\(self.zipCode) \(self.city)"
        }
    }
}
