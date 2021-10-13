
import Foundation

class APIManager
{
    static let shared = APIManager()
    
    var client: APIClientProtocol
    
    init()
    {
        client = APIGraphQlClient()
    }
    
    func cancelEvent(eventId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        client.cancelEvent(eventId: eventId, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func cancelInterview(interviewId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        client.cancelInterview(interviewId: interviewId, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func createEvent(title: String, description: String, startsAt: String, endsAt: String, label: String, street: String, zipCode: String, city: String, countryCode: String, virtualLabel: String, url: String, validatesInterviewRequestAutomatically: Bool, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        client.createEvent(title: title, description: description, startsAt: startsAt, endsAt: endsAt, label: label, street: street, zipCode: zipCode, city: city, countryCode: countryCode, virtualLabel: virtualLabel, url: url, validatesInterviewRequestAutomatically: validatesInterviewRequestAutomatically, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func getEvents(successHandler: @escaping([Event]) -> (), errorHandler: @escaping() -> ()) {
        client.getEvents(successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func getInterviews(successHandler: @escaping([Interview]) -> (), errorHandler: @escaping() -> ()) {
        client.getInterviews(successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func getUser(successHandler: @escaping (User) -> Void, errorHandler: @escaping () -> Void) {
        client.getUser(successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func login(email: String, password: String, successHandler: @escaping (String) -> Void, errorHandler: @escaping () -> Void) {
        client.login(email: email, password: password, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func requestInterview(eventId: String, startsAt: String, successHandler: @escaping () -> Void, errorHandler: @escaping (String) -> Void) {
        client.requestInterview(eventId: eventId, startsAt: startsAt, successHandler: successHandler, errorHandler: errorHandler)
    }
}
