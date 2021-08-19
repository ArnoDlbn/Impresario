
import SwiftUI

struct DetailEventView: View {
    let eventViewModel: EventViewModel
    
    var body: some View {
        ScrollView {
            Spacer()
            Text(eventViewModel.event.bandName ?? "")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.init(.darkGray))
            Text(eventViewModel.event.description ?? "")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
            Spacer()
            HStack(alignment: .center) {
//                Text(verbatim: eventViewModel.event.getEventEntireDate(date: eventViewModel.event.startEvent ?? ""))
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.init(.darkGray))
//                    .frame(width: 150)
//                    .lineLimit(2)
                Image(systemName: "arrow.right.square")
                    .foregroundColor(Color.init(.darkGray))
                    .font(.system(size: 40))
//                Text(eventViewModel.event.getEventEntireDate(date: eventViewModel.event.endEvent ?? ""))
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.init(.darkGray))
//                    .frame(width: 150)
//                    .lineLimit(2)
            }
            Text("Interviews duration")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
                .padding(.top, 10)
            Text("\(eventViewModel.event.duration!) min")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
            //        Spacer()
            VStack(alignment: .leading) {
                ForEach(0..<getRowCount()) { row in // create number of rows
                    HStack {
                        ForEach(0..<getColumnCount(row: row)) { column in // create 3 columns
                            TimeSlotView(timeSlot: eventViewModel.event.timeSlot![row * 3 + column], eventID: eventViewModel.event.id)
                        }
                    }
                }
            }
            .padding(.top, 20)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
                .overlay(Button(action: {
                    CancelEventViewModel.cancelEvent(eventId: eventViewModel.event.id)
                }, label: {
                    Text(" Cancel your event ")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                }))
        }
    }
    func getRowCount() -> Int {
        var rowCount: Int
        
        if eventViewModel.event.timeSlot!.count % 3 == 0 {
            rowCount = eventViewModel.event.timeSlot!.count / 3
        } else {
            rowCount = eventViewModel.event.timeSlot!.count / 3 + 1
        }
        return rowCount
    }
    
    func getColumnCount(row: Int) -> Int {
        var columnCount: Int = 3
        
        if row == getRowCount() - 1 && eventViewModel.event.timeSlot!.count % 3 != 0 {
            columnCount = eventViewModel.event.timeSlot!.count % 3
        }
        return columnCount
    }
    
}

//struct DetailEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEventView()
//    }
//}
