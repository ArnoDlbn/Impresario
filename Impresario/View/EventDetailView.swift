
import SwiftUI

struct EventDetailView: View {
    
    let eventViewModel: EventViewModel
    let userViewModel: UserViewModel
    
    @State private var selectedTimeSlot = ""
    @State private var isViewEventTimeSlots = false
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Starts")
                        Text(eventViewModel.event.fullStartDate ?? "")
                            .lineLimit(2)
                    }
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20))
                    VStack(alignment: .leading) {
                        Text("Ends")
                        Text(eventViewModel.event.fullStartDate ?? "")
                            .lineLimit(2)
                    }
                    Spacer()
                }
                HStack {
                    Image(systemName: "clock")
                        .font(.system(size: 20))
                    Text("\(eventViewModel.event.duration!) min")
                }
                .padding(.top, 5)
                Text("La gaïté Lyrique \n9 rue Huntziger \n92110 Clichy")
                    .padding(.top, 5)
            }
            .padding(20)
            .background(Color(red: 255/255, green: 203/255, blue: 164/255))
            .foregroundColor(.white)
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            VStack(alignment: .leading) {
                Text(eventViewModel.event.title ?? "")
                    .font(.custom("Merriweather-Bold", size: 20, relativeTo: .title))
                    .padding(.bottom, 5)
                Text(eventViewModel.event.description ?? "")
            }
            .padding(20)
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(Button(action: {
                    isViewEventTimeSlots.toggle()
                }, label: {
                    if let user = userViewModel.user {
                        if user.isArtist {
                            Text(" Requested interviews ")
                                .foregroundColor(.white)
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                        } else {
                            Text(" Request an interview ")
                                .foregroundColor(.white)
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                        }
                    }
                }))
            if let user = userViewModel.user {
                if user.isArtist {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                        .frame(width: 220, height: 40, alignment: .center)
                        .overlay(Button(action: {
                            showingAlert.toggle()
                            
                        }, label: {
                            Text(" Cancel your event ")
                                .foregroundColor(.white)
                                .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                        }))
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Cancel an interview"),
                                message: Text("Are you sure you want to cancel this interview?"),
                                primaryButton: .default(
                                    Text("OK"),
                                    action: {
                                        eventViewModel.cancelEvent(eventId: eventViewModel.event.id)
                                        self.presentationMode.wrappedValue.dismiss()
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
                }
            }
            Spacer()
        }
        .navigationTitle(Text(eventViewModel.event.bandName ?? ""))
        .sheet(isPresented: $isViewEventTimeSlots, content: {
            EventTimeSlotsView(eventViewModel: eventViewModel, userViewModel: userViewModel)
        })
    }
}

//struct DetailEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEventView()
//    }
//}
