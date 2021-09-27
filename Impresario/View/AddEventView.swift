
import SwiftUI

struct AddEventView: View {
    
    @State private var eventDescription = String()
    @State private var eventTitle = "Toto"
    @State private var eventStart = Date()
    @State private var eventEnd = Date()
    @State private var interviewDuration = Int()
    @State private var durationsIndex = 0
    var durations = [5, 10, 15, 20, 25, 30]
    
    @State private var label = String()
    @State private var street = String()
    @State private var zipCode = String()
    @State private var city = String()
    @State private var country = String()
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert? = .never
    
    enum ActiveAlert {
        case never, success, failure
        var id: Int {
            hashValue
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add event")
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .font(.custom("KoHo-SemiBold", size: 25, relativeTo: .largeTitle))
            VStack {
                TextField("Event Description", text: $eventDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 220, height: 40, alignment: .center)
                Text("Event Start")
                DatePicker(selection: $eventStart, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                .labelsHidden()
                Text("Event End")
                DatePicker(selection: $eventEnd, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                .labelsHidden()
                
                //                Text("Interview Duration")
                //                    .foregroundColor(Color.init(.darkGray))
                //
                //                Picker("", selection: $durationsIndex) {
                //                    ForEach(0..<durations.count) {
                //                        Text("\(self.durations[$0]) min")
                //                            .tag($0)
                //                    }
                //                }
                //                .pickerStyle(WheelPickerStyle())
                //                .frame(width: 200, height: 150)
                Section {
                    Text("Event Adress")
                    TextField("Label", text: $label)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 220, height: 40, alignment: .center)
                    TextField("Street", text: $street)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 220, height: 40, alignment: .center)
                    HStack(spacing: 10) {
                        TextField("Zip Code", text: $zipCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 65, height: 40, alignment: .center)
                        TextField("City", text: $city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 145, height: 40, alignment: .center)
                    }
                    TextField("Country", text: $country)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 220, height: 40, alignment: .center)
                }
            }
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                .frame(width: 220, height: 40, alignment: .center)
                .overlay(Button(action: {
                    let dateForm = ISO8601DateFormatter()
                    dateForm.timeZone = TimeZone.current
                    let newEnd = dateForm.string(from: eventEnd)
                    let newStart = dateForm.string(from: eventStart)
                    if eventDescription.isEmpty || eventTitle.isEmpty || label.isEmpty || street.isEmpty || zipCode.isEmpty || city.isEmpty || country.isEmpty {
                        activeAlert = .failure
                        showAlert = true
                    } else {
                        activeAlert = .success
                        showAlert = true
                        EventViewModel.createEvent(description: eventDescription, endsAt: newEnd, startsAt: newStart, title: eventTitle) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }, label: {
                    Text(" Create your event ")
                        .foregroundColor(.white)
                        .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                }))
                .alert(isPresented: $showAlert, content: {
                    if activeAlert == .failure {
                        return AlertViewer.showAlertWithNoActions(message: "All fields are required!")
                    } else {
                        return AlertViewer.showAlertWithNoActions(message: "Your event is created!")
                    }
                })
        }
    }
}

//struct AddEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddEventView()
//    }
//}
