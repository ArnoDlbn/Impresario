
import Foundation

class EventsViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    
    func getEvents(errorHandler: @escaping () -> ()) {
        APIManager.shared.getEvents(
            successHandler: { events in
                self.events.removeAll()
                self.events = events
            },
            errorHandler: errorHandler
        )
    }
}
