
import Foundation

struct Address {
    
    let physicalAddress: PhysicalAddress?
    let virtualAddress: VirtualAddress?
    
    init(physicalAddress: PhysicalAddress? = nil,
         virtualAddress: VirtualAddress? = nil) {
        
        self.physicalAddress = physicalAddress
        self.virtualAddress = virtualAddress
    }
}

struct PhysicalAddress {
    
    let label: String?
    let street: String
    let zipCode: String
    let city: String
    let countryCode: String
    
    init(label: String? = nil,
         street: String,
         zipCode: String,
         city: String,
         countryCode: String) {
        
        self.label = label
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.countryCode = countryCode
    }
}

struct VirtualAddress {
    
    let label: String?
    let url: String
    
    init(label: String? = nil,
         url: String) {
        
        self.label = label
        self.url = url
    }
}
