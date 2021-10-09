
import SwiftUI

struct AddEventView: View {
    
    @State private var eventDescription = "Mon nouvel album !"
    @State private var eventTitle = "Safari Disco Club"
    @State private var eventStart = Date()
    @State private var eventEnd = Date()
    @State private var label = "Chez moi"
    @State private var street = "9 rue Huntziger"
    @State private var zipCode = "92110"
    @State private var city = "Clichy"
    @State private var virtualLabel = "Skype"
    @State private var url = "https://www.skype.com"
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
                TextField("Title", text: $eventTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 220, height: 40, alignment: .center)
                Text("Description")
                TextEditor(text: $eventDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary.opacity(0.1)))
                    .frame(width: 220, height: 80, alignment: .center)
                Section {
                    Text("Start")
                    DatePicker(selection: $eventStart, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                    .labelsHidden()
                    Text("End")
                    DatePicker(selection: $eventEnd, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                    .labelsHidden()
                }
                Section {
                    Text("Physical Address")
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
                }
                Section {
                    Text("Virtual Address")
                    TextField("Label", text: $virtualLabel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 220, height: 40, alignment: .center)
                    TextField("URL", text: $url)
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
                    if eventDescription.isEmpty || eventTitle.isEmpty || label.isEmpty || street.isEmpty || zipCode.isEmpty || city.isEmpty || virtualLabel.isEmpty || url.isEmpty {
                        activeAlert = .failure
                        showAlert = true
                    } else {
                        activeAlert = .success
                        showAlert = true
                        debugPrint(newStart)
                        debugPrint(newEnd)
                        EventViewModel.createEvent(title: eventTitle,
                                                   description: eventDescription,
                                                   startsAt: newStart,
                                                   endsAt: newEnd,
                                                   label: label,
                                                   street: street,
                                                   zipCode: zipCode,
                                                   city: city,
                                                   countryCode: "FR",
                                                   virtualLabel: virtualLabel,
                                                   url: url,
                                                   successHandler: {},
                                                   errorHandler: {})
                    }
                }, label: {
                    Text(" Create your event ")
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .largeTitle))
                }))
                .alert(isPresented: $showAlert, content: {
                    if activeAlert == .failure {
                        return AlertViewer.showAlertWithNoActions(message: "All fields are required!") {}
                    } else {
                        return AlertViewer.showAlertWithNoActions(message: "Your event is created!") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                })
        }
    }
}
