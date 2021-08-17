//
//  InterviewRowView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 15/08/2021.
//

import SwiftUI

struct InterviewRowView: View {
    let interview: Interview
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.init(.darkGray), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
//                    .overlay(Text(viewModel.getEventDay(date: interview.startsAt))
//                                .font(.system(size: 20, weight: .bold))
//                                .foregroundColor(Color.init(.darkGray))
//                    )
//                Text(viewModel.getEventHoursAndMinutes(date: interview.startsAt))
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.init(.darkGray))
            }
            Spacer()
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(interview.event.bandName ?? "")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.init(.darkGray))
                Text(interview.event.description ?? "")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
                Text("La Gaîté Lyrique \n3bis rue Papin \n75003 Paris")
                    .font(.system(size: 20))
                    .foregroundColor(Color.init(.darkGray))
            }
            .foregroundColor(Color.init(.darkGray))
            Spacer()
        }
    }
}

//struct InterviewRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterviewRowView()
//    }
//}
