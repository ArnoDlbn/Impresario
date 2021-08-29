
import SwiftUI

struct TimeSlotView: View {
    
    @ObservedObject var timeSlotViewModel: TimeSlotViewModel
    let eventID: String
    
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if timeSlotViewModel.timeSlot.isAvailable {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 120, height: 30, alignment: .center)
                .overlay(Button(timeSlotViewModel.timeSlot.hourAndMinutes!, action: {
                    showingAlert.toggle()                    
                })
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .semibold))
                )
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Request an interview"),
                        message: Text("Are you sure you want to request this interview?"),
                        primaryButton: .default(
                            Text("OK"),
                            action: {
                                InterviewViewModel.requestInterview(eventId: eventID, startsAt: timeSlotViewModel.timeSlot.startsAt) {
                                    //                                    print(timeSlotViewModel.timeSlot.startsAt)
                                    self.presentationMode.wrappedValue.dismiss()
                                    //                                    var newTimeSlot = timeSlotViewModel.timeSlot
                                    //                                    newTimeSlot.isAvailable = false
                                    //                                    timeSlotViewModel.timeSlot = newTimeSlot
                                    //                                    print(timeSlotViewModel.timeSlot.isAvailable)
                                }
                            }
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {
                                //                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                    )
                }
        } else {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(.darkGray))
                .foregroundColor(Color.init(.white))
                .frame(width: 120, height: 30, alignment: .center)
                .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .semibold))
                )
        }
    }
}

//struct TimeSlotView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeSlotView(timeSlot: TimeSlot(startsAt: "2021-07-18 11:53:42.801883+0200", isAvailable: false, rawStartsAt: "2021-07-18 11:53:42.801883+0200"), eventID: "123")
//    }
//}
