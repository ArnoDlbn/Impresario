
import SwiftUI

struct InterviewDetailView: View {
    
    @EnvironmentObject var interviewsViewModel: InterviewsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    let interviewViewModel: InterviewViewModel
    
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Section {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Starts")
                            Text(interviewViewModel.interview.fullStartDate ?? "")
                                .lineLimit(2)
                        }
                        Image(systemName: "arrow.right")
                            .font(.system(size: 20))
                        VStack(alignment: .leading) {
                            Text("Ends")
                            Text(interviewViewModel.interview.fullEndDate ?? "")
                                .lineLimit(2)
                        }
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 20))
                        Text("\(interviewViewModel.interview.event.duration!) min")
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    if let physicalMeeting = interviewViewModel.interview.event.physicalAddress {
                        Text(physicalMeeting.fullAddress ?? "")
                            .padding(.bottom, 5)
                    }
                    if let virtualMeeting = interviewViewModel.interview.event.virtualAddress {
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
                    //                            Spacer()
                    //                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.9006988, longitude: 2.3029164), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))), interactionModes: [])
                    //                            .frame(width: 200, height: 100)
                    //                    }
                    //                    .padding(.top, 5)
                }
                .padding(20)
                .background(Color(red: 255/255, green: 203/255, blue: 164/255))
                .foregroundColor(.white)
                .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
                VStack(alignment: .leading) {
                    Text(interviewViewModel.interview.event.title ?? "")
                        .font(.custom("Merriweather-Bold", size: 20, relativeTo: .title))
                        .padding(.bottom, 5)
                    Text(interviewViewModel.interview.event.description ?? "")
                        .lineSpacing(5)
                }
                .padding(20)
                .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
            }
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(
                    Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Text(" Cancel your interview ")
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                    })
                )
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Cancel an interview"),
                        message: Text("Are you sure you want to cancel this interview?"),
                        primaryButton: .default(
                            Text("OK"),
                            action: {
                                let interviewId: String = interviewViewModel.interview.id
                                interviewViewModel.cancelInterview(
                                    interviewId: interviewId,
                                    successHandler: {
                                        interviewsViewModel.interviews = interviewsViewModel.interviews.filter { $0.id != interviewId }
                                        self.presentationMode.wrappedValue.dismiss()
                                    },
                                    errorHandler: {
                                        self.presentationMode.wrappedValue.dismiss()
                                        userViewModel.logOut()
                                    }
                                )
                            }
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {}
                        )
                    )
                }
        }
        .navigationTitle(Text(interviewViewModel.interview.event.bandName ?? ""))
    }
}
