
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
    
    static func requestInterview(eventId: String, startsAt: String, completion: @escaping () -> Void) {
        Network.shared.apollo.perform(mutation: RequestInterviewMutation(input: InterviewRequestInput(eventId: eventId, startsAt: startsAt))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
                completion()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func cancelInterview(interviewId: String) {
        Network.shared.apollo.perform(mutation: CancelInterviewMutation(input: CanceledInterviewInput(interviewId: interviewId))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
            //                completion()
            case .failure(let error):
                debugPrint(error)
            }
        }
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
