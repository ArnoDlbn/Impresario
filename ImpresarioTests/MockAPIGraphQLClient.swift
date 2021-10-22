
import Foundation
@testable import Impresario

class MockAPIGraphQLClient: APIClientProtocol
{
    func cancelEvent(eventId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
    }
    
    func cancelInterview(interviewId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
    }
    
    func createEvent(title: String, description: String, startsAt: String, endsAt: String, label: String, street: String, zipCode: String, city: String, countryCode: String, virtualLabel: String, url: String, validatesInterviewRequestAutomatically: Bool, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
    }
    
    func login(email: String, password: String, successHandler: @escaping (String) -> Void, errorHandler: @escaping () -> Void) {
    }
    
    func getEvents(successHandler: @escaping ([Event]) -> (), errorHandler: @escaping () -> ())
    {
        if let url = getJson(name: "events") {
            do {
                let jsonData = try Data(contentsOf: url, options: .alwaysMapped)
                let jsonDecoder =  JSONDecoder()
                let events = try? jsonDecoder.decode(Array<Event>.self, from: jsonData)
                debugPrint("YEAH")
                successHandler(events!)
            } catch {
                errorHandler()
            }
        } else {
            debugPrint("Invalid path")
        }
    }
    
    func getInterviews(successHandler: @escaping ([Interview]) -> (), errorHandler: @escaping () -> ()) {
        if let url = getJson(name: "interviews") {
            do {
                let jsonData = try Data(contentsOf: url, options: .alwaysMapped)
                let jsonDecoder =  JSONDecoder()
                let interviews = try? jsonDecoder.decode(Array<Interview>.self, from: jsonData)
                debugPrint("YEAH")
                successHandler(interviews!)
            } catch {
                errorHandler()
            }
        } else {
            debugPrint("Invalid path")
        }
    }
    
    func getUser(successHandler: @escaping (User) -> Void, errorHandler: @escaping () -> Void) {
        if let url = getJson(name: "user") {
            do {
                let jsonData = try Data(contentsOf: url, options: .alwaysMapped)
                let jsonDecoder =  JSONDecoder()
                let user = try? jsonDecoder.decode(User.self, from: jsonData)
                debugPrint("YEAH")
                successHandler(user!)
            } catch {
                errorHandler()
            }
        } else {
            debugPrint("Invalid path")
        }
    }
    
    func requestInterview(eventId: String, startsAt: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
    }
    
    func getJson(name: String) -> URL? {
        return Bundle.main.url(forResource: name, withExtension: "json")
    }
}
