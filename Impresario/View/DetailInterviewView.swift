//
//  DetailInterviewView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 15/08/2021.
//

import SwiftUI

struct DetailInterviewView: View {
    
    let interviewViewModel: InterviewViewModel
    
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            Spacer()
            Text(interviewViewModel.interview.event.bandName ?? "")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.init(.darkGray))
            Text(interviewViewModel.interview.event.description ?? "")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.init(.darkGray))
            Spacer()
            HStack(alignment: .center) {
//                Text(viewModel.getEventEntireDate(date: interview.startsAt))
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.init(.darkGray))
//                    .frame(width: 150)
//                    .lineLimit(2)
                Image(systemName: "arrow.right.square")
                    .foregroundColor(Color.init(.darkGray))
                    .font(.system(size: 40))
//                Text(viewModel.getEventEntireDate(date: viewModel.endEvent ?? ""))
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.init(.darkGray))
//                    .frame(width: 150)
//                    .lineLimit(2)
            }
//            Text("Interviews duration")
//                .font(.system(size: 20, weight: .semibold))
//                .foregroundColor(Color.init(.darkGray))
//                .padding(.top, 10)
//            Text("\(viewModel.duration!) min")
//                .font(.system(size: 20, weight: .semibold))
//                .foregroundColor(Color.init(.darkGray))
//            //        Spacer()
//            VStack(alignment: .leading) {
//                ForEach(0..<getRowCount()) { row in // create number of rows
//                    HStack {
//                        ForEach(0..<getColumnCount(row: row)) { column in // create 3 columns
//                            TimeSlotView(timeSlot: viewModel.timeSlot![row * 3 + column], eventID: viewModel.eventId ?? "")
//                        }
//                    }
//                }
//            }
//            .padding(.top, 20)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(.darkGray))
                .frame(width: 200, height: 40, alignment: .center)
                .overlay(Button(action: {
                    showingAlert.toggle()
                }, label: {
                    Text(" Cancel your interview ")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                }))
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Cancel an interview"),
                        message: Text("Are you sure you want to cancel this interview?"),
                        primaryButton: .default(
                            Text("OK"),
                            action: {
                                interviewViewModel.cancelInterview(interviewId: interviewViewModel.interview.id) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }                                
                            }
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {
//                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                    )
                }
        }
    }
//    func getRowCount() -> Int {
//        var rowCount: Int
//
//        if viewModel.timeSlot!.count % 3 == 0 {
//            rowCount = viewModel.timeSlot!.count / 3
//        } else {
//            rowCount = viewModel.timeSlot!.count / 3 + 1
//        }
//        return rowCount
//    }
    
//    func getColumnCount(row: Int) -> Int {
//        var columnCount: Int = 3
//
//        if row == getRowCount() - 1 && viewModel.timeSlot!.count % 3 != 0 {
//            columnCount = viewModel.timeSlot!.count % 3
//        }
//        return columnCount
//    }
    
}

//struct DetailInterviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailInterviewView()
//    }
//}
