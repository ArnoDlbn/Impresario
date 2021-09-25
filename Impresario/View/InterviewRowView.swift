
import SwiftUI

struct InterviewRowView: View {
    
    let interviewViewModel: InterviewViewModel
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 255/255, green: 203/255, blue: 164/255), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text(interviewViewModel.interview.day ?? ""))
                Text(interviewViewModel.interview.hourAndMinutes ?? "")
                Spacer()
            }
            .frame(width: 60)
            .font(.custom("Merriweather-Regular", size: 20, relativeTo: .body))
            .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text(interviewViewModel.interview.event.bandName ?? "")
                    .font(.custom("Merriweather-Regular", size: 20, relativeTo: .body))
                Text(interviewViewModel.interview.event.description ?? "")
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    Text("La Gaîté Lyrique")
                }
                Spacer()
            }
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
        }
    }
}

//struct InterviewRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterviewRowView()
//    }
//}
