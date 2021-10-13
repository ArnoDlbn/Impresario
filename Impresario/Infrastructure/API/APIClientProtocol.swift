
import Foundation

protocol APIClientProtocol
{
    func cancelEvent(eventId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void)
        
    func cancelInterview(interviewId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void)
    
    func createEvent(title: String, description: String, startsAt: String, endsAt: String, label: String, street: String, zipCode: String, city: String, countryCode: String, virtualLabel: String, url: String, validatesInterviewRequestAutomatically: Bool, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void)

    func login(email: String, password: String, successHandler: @escaping (String) -> Void, errorHandler: @escaping () -> Void)
    
    func getEvents(successHandler: @escaping([Event]) -> (), errorHandler: @escaping () -> ())
    
    func getInterviews(successHandler: @escaping ([Interview]) -> (), errorHandler: @escaping () -> ())
    
    func getUser(successHandler: @escaping (User) -> Void, errorHandler: @escaping () -> Void)
    
    func requestInterview(eventId: String, startsAt: String, successHandler: @escaping () -> Void, errorHandler: @escaping (String) -> Void)
}
