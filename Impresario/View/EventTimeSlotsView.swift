
import SwiftUI

struct EventTimeSlotsView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    let eventViewModel: EventViewModel
    
    var body: some View {
        VStack {
            if userViewModel.user.isArtist {
                Text("Requested interviews")
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .font(.custom("KoHo-SemiBold", size: 25, relativeTo: .largeTitle))
                    .padding(.bottom, 20)
                HStack {
                    Text("Slots avalaible")
                        .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
                    Image(systemName: "arrow.down")
                }
            } else {
                Text("Request an interview")
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .font(.custom("KoHo-SemiBold", size: 25, relativeTo: .largeTitle))
                    .padding(.bottom, 20)
                HStack {
                    Text("Pick a slot")
                        .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
                    Image(systemName: "arrow.down")
                }
            }
            ForEach(0..<getRowCount()) { row in // create number of rows
                HStack {
                    ForEach(0..<getColumnCount(row: row)) { column in // create 3 columns
                        EventTimeSlotView(timeSlotViewModel: TimeSlotViewModel(withTimeSlot: eventViewModel.event.timeSlot![row * 3 + column]), eventID: eventViewModel.event.id)
                    }
                }
            }
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .foregroundColor(Color.init(.white))
                    .frame(width: 120, height: 30, alignment: .center)
                    .overlay(Text("Available")
                                .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    )
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    .frame(width: 120, height: 30, alignment: .center)
                    .overlay(Text("Unavailable")
                                .foregroundColor(.white)
                    )
            }
            .font(.custom("MerriweatherSans-ExtraBold", size: 15, relativeTo: .body))
            .padding(.top, 50)
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
