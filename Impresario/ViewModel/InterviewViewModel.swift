
import Foundation

class InterviewViewModel {
    
    var interview: Interview
    
    init(withInterview interview: Interview) {
        self.interview = interview
    }
    
    static func from(content: InterviewsQuery.Data.Interview.Edge.Node) -> Interview {
        
        let startsAt = content.startsAt
        let endsAt = content.endsAt
        let event = EventViewModel.from(content: content.event)
        let id = content.id

        return Interview(startsAt: startsAt, endsAt: endsAt, event: event, id: id)
    }
    
    func getEventHoursAndMinutes(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let hour = calendar.component(.hour, from: dateFormatted ?? currentDate)
        let minutes = calendar.component(.minute, from: dateFormatted ?? currentDate)
        let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
        let result = "\(hour):\(minutesString)"
        return result
    }
    
    func getEventDay(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let day = calendar.component(.day, from: dateFormatted ?? currentDate)
        let result = "\(day)"
        return result
    }
    
    func getEventEntireDate(date: String) -> String {
        let currentDate = Date()
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        let dateFormatted = dateFormatter.date(from: date)
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let month = calendar.component(.month, from: dateFormatted ?? currentDate)
        let monthString = month<10 ? String(format: "%02d", month) : String(month)
        let year = calendar.component(.year, from: dateFormatted ?? currentDate)
        let day = calendar.component(.day, from: dateFormatted ?? currentDate)
        let hour = calendar.component(.hour, from: dateFormatted ?? currentDate)
        let minutes = calendar.component(.minute, from: dateFormatted ?? currentDate)
        let minutesString = minutes<10 ? String(format: "%02d", minutes) : String(minutes)
        let result = "\(day)/\(monthString)/\(year) at \(hour):\(minutesString)"
        return result
    }
}
