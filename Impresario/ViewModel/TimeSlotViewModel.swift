
import Foundation

class TimeSlotViewModel: ObservableObject {
    
    @Published var timeSlot: TimeSlot
    
    init(withTimeSlot timeSlot: TimeSlot) {
        self.timeSlot = timeSlot
    }
}
