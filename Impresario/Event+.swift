
extension Event {
    
    var day : String? {
        DateFormatter.getDay(date: self.startEvent)
    }
    
    var hourAndMinutes : String? {
        DateFormatter.getHoursAndMinutes(date: self.startEvent)
    }
    
    var fullStartDate : String? {
        DateFormatter.getFullDate(date: self.startEvent)
    }
    
    var fullEndDate : String? {
        DateFormatter.getFullDate(date: self.endEvent)
    }
    
    var fullAddress : String? {
        if let address = self.address {
            if let physicalAddress = address.physicalAddress {
                if let label = physicalAddress.label {
                    return "\(label) \n\(physicalAddress.street) \n\(physicalAddress.zipCode) \(physicalAddress.city)"
                } else {
                    return "\(physicalAddress.street) \n\(physicalAddress.zipCode) \(physicalAddress.city)"
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
