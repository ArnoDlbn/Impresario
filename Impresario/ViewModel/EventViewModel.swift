
import Foundation
import SwiftUI

class EventViewModel: Identifiable {
    
    var event: Event
    
    init(withEvent event: Event) {
        self.event = event
    }
    
    static func createEvent(title: String, description: String, startsAt: String, endsAt: String, label: String, street: String, zipCode: String, city: String, countryCode: String, virtualLabel: String, url: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        APIManager.shared.createEvent(
            title: title,
            description: description,
            startsAt: startsAt,
            endsAt: endsAt,
            label: label,
            street: street,
            zipCode: zipCode,
            city: city,
            countryCode: countryCode,
            virtualLabel: virtualLabel,
            url: url,
            validatesInterviewRequestAutomatically: true,
            successHandler: successHandler,
            errorHandler: errorHandler
        )
    }
    
    func cancelEvent(eventId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        APIManager.shared.cancelEvent(
            eventId: eventId,
            successHandler: successHandler,
            errorHandler: errorHandler
        )
    }
}
