
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
}
