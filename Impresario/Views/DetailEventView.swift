
import SwiftUI

struct DetailEventView: View {
    let viewModel: EventViewModel
    
    var body: some View {
        Spacer()
        Text(viewModel.bandName)
            .foregroundColor(Color.init(.darkGray))
            .font(.custom("Marker Felt Wide", size: 25, relativeTo: .largeTitle))
        Text(viewModel.description ?? "")
            .foregroundColor(Color.init(.darkGray))
            .font(.custom("Marker Felt Wide", size: 15, relativeTo: .body))
        Spacer()
        HStack {
            Text(viewModel.startEvent)
                .foregroundColor(Color.init(.darkGray))
                .font(.custom("Marker Felt", size: 15, relativeTo: .body))
                .frame(width: 150)
                .lineLimit(2)
            Image(systemName: "arrow.right.square")
                .foregroundColor(Color.init(.darkGray))
                .font(.custom("Marker Felt Wide", size: 35, relativeTo: .largeTitle))
            Text(viewModel.endEvent)
                .foregroundColor(Color.init(.darkGray))
                .font(.custom("Marker Felt", size: 15, relativeTo: .body))
                .frame(width: 150)
                .lineLimit(2)
        }
        Text("\(viewModel.duration) min")
            .foregroundColor(Color.init(.darkGray))
            .font(.custom("Marker Felt Wide", size: 15, relativeTo: .body))
            .padding(.top, 5)
        Spacer()
        VStack(alignment: .leading) {
            ForEach(0..<getRowCount()) { row in // create number of rows
                HStack {
                    ForEach(0..<getColumnCount(row: row)) { column in // create 3 columns
                        TimeSlotView(timeSlot: viewModel.timeSlot![row * 3 + column])
                    }
                }
            }
        }
        Spacer()
    }
    
    func getRowCount() -> Int {
        var rowCount: Int
        
        if viewModel.timeSlot!.count % 3 == 0 {
            rowCount = viewModel.timeSlot!.count / 3
        } else {
            rowCount = viewModel.timeSlot!.count / 3 + 1
        }
        return rowCount
    }
    
    func getColumnCount(row: Int) -> Int {
        var columnCount: Int = 3
        
        if row == getRowCount() - 1 && viewModel.timeSlot!.count % 3 != 0 {
            columnCount = viewModel.timeSlot!.count % 3
        }
        return columnCount
    }
}

//struct DetailEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEventView()
//    }
//}
