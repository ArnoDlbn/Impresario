
import SwiftUI

struct AddEventView: View {
    @State private var eventDescription = ""
    @State private var eventStart = Date()
    @State private var eventEnd = Date()
    @State private var interviewDuration = ""
    
    @State private var birthDate = Date()
    @State private var minutes = Date()

    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Add event")
                .foregroundColor(Color.init(.darkGray))
                .font(.custom("Marker Felt Wide", size: 25, relativeTo: .largeTitle))
            VStack {
                TextField("Event Description", text: $eventDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                //                TextField("Event Start", text: $eventStart)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                    .foregroundColor(Color.init(.darkGray))
                //                    .frame(width: 200, height: 40, alignment: .center)
                DatePicker("Enter your birthday", selection: $birthDate)
                    .datePickerStyle(WheelDatePickerStyle())
                    .frame(maxHeight: 400)
                DatePicker(selection: $birthDate, in: Date()..., displayedComponents: .date) { Text("yo") }
                Text("Event Start")
                    .foregroundColor(Color.init(.darkGray))
                
                HStack {
                    DatePicker(selection: $birthDate, in: Date()..., displayedComponents: .date) {}
                        .labelsHidden()
                    DatePicker(selection: $birthDate, in: Date()..., displayedComponents: .hourAndMinute) {}
                        .labelsHidden()
                }
                //                TextField("Event End", text: $eventEnd)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //                    .foregroundColor(Color.init(.darkGray))
                //                    .frame(width: 200, height: 40, alignment: .center)
                TextField("Interview Duration", text: $interviewDuration)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                Picker("", selection: $minutes){
                    ForEach(0..<60, id: \.self) { i in
                        Text("\(i) min").tag(i)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 180)
                .clipped()
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                    .overlay(Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text(" Create your event ")
                            .foregroundColor(.white)
                            .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                    }))
            }
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
