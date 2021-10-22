
import SwiftUI
import MapKit

struct EventDetailView: View {
    
    @EnvironmentObject var eventsViewModel: EventsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    let eventViewModel: EventViewModel
    let mapViewer = MapViewer()
    var annotationItems: [MyAnnotationItem] = [
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 48.9006988, longitude: 2.3029164))
        ]
    
    @State private var selectedTimeSlot = ""
    @State private var isViewEventTimeSlots = false
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Section {
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
                            Text(eventViewModel.event.fullEndDate ?? "")
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
                    .padding(.bottom, 5)
                    HStack {
                        VStack {
                    if let physicalMeeting = eventViewModel.event.physicalAddress {
                        Text(physicalMeeting.fullAddress ?? "")
                            .padding(.bottom, 5)
                    }
                    if let virtualMeeting = eventViewModel.event.virtualAddress {
                        HStack {
                            Image(systemName: "video")
                                .font(.system(size: 20))
                                .padding(.leading, 10)
                            Link(virtualMeeting.label ?? "Virtual meeting", destination: URL(string: virtualMeeting.url)!)
                                .padding(.trailing, 10)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(.white)
                                    .foregroundColor(Color.init(.white))
                                    .frame(height: 30))
                    }
                    }
                    Spacer()
                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.9006988, longitude: 2.3029164), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))), interactionModes: MapInteractionModes.all, annotationItems: annotationItems) { item in
                            MapPin(coordinate: item.coordinate)
                            
                        }
                        .frame(width: 200, height: 100)
                    }
                }
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
                    .lineSpacing(5)
            }
            .padding(20)
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
        }
        Section {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(Button(action: {
                    isViewEventTimeSlots.toggle()
                    getAddressMap(address: "La gaïté Lyrique \n9 rue Huntziger \n92110 Clichy") { location in
                        debugPrint(location)
                    }
                }, label: {
                    if userViewModel.user.isArtist {
                        Text(" Requested interviews ")
                            .foregroundColor(.white)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                            .frame(width: 200)
                    } else {
                        Text(" Request an interview ")
                            .foregroundColor(.white)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                            .frame(width: 200)
                    }
                }))
            if userViewModel.user.isArtist {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .frame(width: 220, height: 40, alignment: .center)
                    .overlay(Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Text(" Cancel your event ")
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                    }))
                    .alert(isPresented: $showingAlert) {
                        AlertViewer.showAlertWithActions(message: "Are you sure you want to cancel this event?") {
                            let eventId: String = eventViewModel.event.id
                            eventViewModel.cancelEvent(
                                eventId: eventId,
                                successHandler: {
                                    eventsViewModel.events = eventsViewModel.events.filter { $0.id != eventId }
                                    self.presentationMode.wrappedValue.dismiss()
                                },
                                errorHandler: {
                                    self.presentationMode.wrappedValue.dismiss()
                                    userViewModel.logOut()
                                }
                            )
                        }
                    }
            }
        }
        Spacer()
            .navigationTitle(Text(eventViewModel.event.bandName ?? ""))
            .sheet(isPresented: $isViewEventTimeSlots, content: {
                EventTimeSlotsView(eventViewModel: eventViewModel)
            })
    }
    
    func getAddressMap(address : String, completion: @escaping (CLLocationCoordinate2D) -> Void) {
        mapViewer.getAddressCoordinates(from: address) { location in
            guard let location = location else {
                return
            }
            completion(location)
        }
    }
}
