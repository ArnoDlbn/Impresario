
import SwiftUI

struct AddEventView: View {
    @State private var eventDescription = ""
    @State private var eventStart = Date()
    @State private var eventEnd = Date()
    @State private var interviewDuration = ""
    @State private var durationsIndex = 0
    var durations = [5, 10, 15, 20, 25, 30]

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
                DatePicker(selection: $eventStart, in: Date()..., displayedComponents: [.date, .hourAndMinute]) { Text("Event Start")
                    .foregroundColor(Color.init(.darkGray))
                }
                    .frame(width: 350)
                DatePicker(selection: $eventEnd, in: Date()..., displayedComponents: [.date, .hourAndMinute]) { Text("Event End")
                    .foregroundColor(Color.init(.darkGray))
                }
                .foregroundColor(Color.init(.darkGray))
                    .frame(width: 350)
                Text("Event Start")
                    .foregroundColor(Color.init(.darkGray))
                    DatePicker(selection: $eventStart, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                        .labelsHidden()
                Text("Event End")
                    .foregroundColor(Color.init(.darkGray))
                    DatePicker(selection: $eventEnd, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {}
                        .labelsHidden()
                
                Text("Interview Duration")
                    .foregroundColor(Color.init(.darkGray))
                
                Picker("", selection: $durationsIndex) {
                    ForEach(0..<durations.count) {
                        Text("\(self.durations[$0]) min")
                            .tag($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 200, height: 150)
//                                        .clipped()
                Text("Event Adress")
                    .foregroundColor(Color.init(.darkGray))
//                TextField("Event Description", text: $eventDescription)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .foregroundColor(Color.init(.darkGray))
//                    .frame(width: 200, height: 40, alignment: .center)
//                NavigationView {
//                Form {
//                    Section {
//                        TextField("Event Description", text: $eventDescription)
//                            .foregroundColor(Color.init(.darkGray))
//                    }
//                    Section {
//                        DatePicker(selection: $eventStart, in: Date()..., displayedComponents: [.date, .hourAndMinute]) { Text("Event Start")
//                            .foregroundColor(Color.init(.darkGray))
//                        }
//                    }
//                    Section {
//                        DatePicker(selection: $eventEnd, in: Date()..., displayedComponents: [.date, .hourAndMinute]) { Text("Event End")
//                            .foregroundColor(Color.init(.darkGray))
//                        }
//                    }
//                    Section {
//                        Picker("Duration", selection: $interviewDuration){
//                            ForEach(0..<durations.count) {
//                                Text("\(self.durations[$0]) min")
//                                    .tag($0)
//                            }
//                        }
////                        .pickerStyle(WheelPickerStyle())
//        //                .frame(width: 180)
//        //                .clipped()
//                    }
//
//                }.navigationTitle("Add Event")
//                .foregroundColor(.black)
//                }.foregroundColor(.black)
                
                
            }
            .frame(height: 700)
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

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
