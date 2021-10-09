
import SwiftUI

struct EventTimeSlotView: View {
    
    @ObservedObject var timeSlotViewModel: TimeSlotViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    let eventID: String
    
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if userViewModel.user.isArtist {
            if timeSlotViewModel.timeSlot.isAvailable {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .foregroundColor(Color.init(.white))
                    .frame(width: 120, height: 30, alignment: .center)
                    .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                    )
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .frame(width: 120, height: 30, alignment: .center)
                    .overlay(Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                                .foregroundColor(.white)
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                    )
            }
        } else {
            if timeSlotViewModel.timeSlot.isAvailable {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .foregroundColor(Color.init(.white))
                    .frame(width: 120, height: 30, alignment: .center)
                    .overlay(Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Text(timeSlotViewModel.timeSlot.hourAndMinutes!)
                            .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                            .frame(width: 100)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
                    }))
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Request an interview"),
                            message: Text("Are you sure you want to request this interview?"),
                            primaryButton: .default(
                                Text("OK"),
                                action: {
                                    InterviewViewModel.requestInterview(
                                        eventId: eventID,
                                        startsAt: timeSlotViewModel.timeSlot.startsAt,
                                        successHandler: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        },
                                        errorHandler: {
                                            userViewModel.logOut()
                                        }
                                        //                                    var newTimeSlot = timeSlotViewModel.timeSlot
                                        //                                    newTimeSlot.isAvailable = false
                                        //                                    timeSlotViewModel.timeSlot = newTimeSlot
                                    )
                                }
                            ),
                            secondaryButton: .destructive(
                                Text("Cancel"),
                                action: {}
                            )
                        )
                    }
            } else {
                RoundedRectangle(cornerRadius: 15)
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
