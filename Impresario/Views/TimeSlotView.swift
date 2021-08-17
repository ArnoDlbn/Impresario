
import SwiftUI

struct TimeSlotView: View {
    let timeSlot: TimeSlot
    let eventID: String
    let addInterviewViewModel = AddInterviewViewModel()
    
    @State private var showingAlert = false
    
    var body: some View {
        if timeSlot.isAvailable {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.init(.darkGray))
            .frame(width: 120, height: 30, alignment: .center)
            .overlay(Button("\(timeSlot.startsAt)", action: { addInterviewViewModel.requestInterview(eventId: eventID, startsAt: timeSlot.rawStartsAt) {
            }})
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
            )
            .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                    }
        } else {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(.darkGray))
                .foregroundColor(Color.init(.white))
                .frame(width: 120, height: 30, alignment: .center)
                .overlay(Text("\(timeSlot.startsAt)")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .semibold))
                )
        }
    }
}

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlotView(timeSlot: TimeSlot(startsAt: "2021-07-18 11:53:42.801883+0200", isAvailable: false, rawStartsAt: "2021-07-18 11:53:42.801883+0200"), eventID: "123")
    }
}
