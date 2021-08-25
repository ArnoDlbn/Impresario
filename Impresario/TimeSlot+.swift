
extension TimeSlot {
    
    var hourAndMinutes : String? {
        DateFormatter.getHoursAndMinutes(date: self.startsAt)
    }
}
