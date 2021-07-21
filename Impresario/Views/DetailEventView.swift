
import SwiftUI

struct DetailEventView: View {
    let viewModel: EventViewModel
    
    var body: some View {
        ScrollView {
            Spacer()
            Text(viewModel.bandName)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.init(.darkGray))
            Text(viewModel.description ?? "")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
            Spacer()
            HStack(alignment: .center) {
                Text(viewModel.getEventEntireDate(date: viewModel.startEvent))
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 150)
                    .lineLimit(2)
                Image(systemName: "arrow.right.square")
                    .foregroundColor(Color.init(.darkGray))
                    .font(.system(size: 40))
                Text(viewModel.getEventEntireDate(date: viewModel.endEvent))
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 150)
                    .lineLimit(2)
            }
            Text("Interviews duration")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
                .padding(.top, 10)
            Text("\(viewModel.duration) min")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
            //        Spacer()
            VStack(alignment: .leading) {
                ForEach(0..<getRowCount()) { row in // create number of rows
                    HStack {
                        ForEach(0..<getColumnCount(row: row)) { column in // create 3 columns
                            TimeSlotView(timeSlot: viewModel.timeSlot![row * 3 + column])
                        }
                    }
                }
            }
            .padding(.top, 20)
            Spacer()
        }
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
