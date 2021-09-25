
import SwiftUI

struct EventTimeSlotView: View {
    
    @ObservedObject var timeSlotViewModel: TimeSlotViewModel
    let eventID: String
    let userViewModel: UserViewModel
    
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if let user = userViewModel.user {
            if user.isArtist {
                if timeSlotViewModel.timeSlot.isAvailable {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 255/255, green: 203/255, blue: 164/255))
                        .foregroundColor(Color.init(.white))
                        .frame(width: 120, height: 30, alignment: .center)
                        .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                                    .foregroundColor(.black)
                                    .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                        )
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                        .frame(width: 120, height: 30, alignment: .center)
                        .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                                    .foregroundColor(.white)
                                    .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                        )
                }
            } else {
                if timeSlotViewModel.timeSlot.isAvailable {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 255/255, green: 203/255, blue: 164/255))
                        .foregroundColor(Color.init(.white))
                        .frame(width: 120, height: 30, alignment: .center)
                        .overlay(Button(timeSlotViewModel.timeSlot.hourAndMinutes!, action: {
                            showingAlert.toggle()                    
                        })
                        .foregroundColor(.black)
                        .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                        )
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Request an interview"),
                                message: Text("Are you sure you want to request this interview?"),
                                primaryButton: .default(
                                    Text("OK"),
                                    action: {
                                        InterviewViewModel.requestInterview(eventId: eventID, startsAt: timeSlotViewModel.timeSlot.startsAt) {
                                            self.presentationMode.wrappedValue.dismiss()
                                            //                                    var newTimeSlot = timeSlotViewModel.timeSlot
                                            //                                    newTimeSlot.isAvailable = false
                                            //                                    timeSlotViewModel.timeSlot = newTimeSlot
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
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                        .frame(width: 120, height: 30, alignment: .center)
                        .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                                    .foregroundColor(.white)
                                    .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                        )
                }
            }
        }
    }
}

//struct TimeSlotView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeSlotView(timeSlot: TimeSlot(startsAt: "2021-07-18 11:53:42.801883+0200", isAvailable: false, rawStartsAt: "2021-07-18 11:53:42.801883+0200"), eventID: "123")
//    }
//}
