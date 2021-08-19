
import Foundation

struct Address {
    
    let label: String?
    let street: String?
    let zipCode: String?
    let city: String?
    let country: String?
    let countryCode: String?
    
    init(label: String? = nil,
         street: String? = nil,
         zipCode: String? = nil,
         city: String? = nil,
         country: String? = nil,
         countryCode: String? = nil) {
        
        self.label = label
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.country = country
        self.countryCode = countryCode
    }
}
