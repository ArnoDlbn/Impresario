
extension Interview {
    
    var day : String? {
        DateFormatter.getDay(date: self.startsAt)
    }
    
    var hourAndMinutes : String? {
        DateFormatter.getHoursAndMinutes(date: self.startsAt)
    }
    
    var fullStartDate : String? {
        DateFormatter.getFullDate(date: self.startsAt)
    }
    
    var fullEndDate : String? {
        DateFormatter.getFullDate(date: self.endsAt)
    }
}