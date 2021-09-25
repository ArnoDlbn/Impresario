
import SwiftUI

struct EventRowView: View {
    
    let eventViewModel: EventViewModel
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 255/255, green: 203/255, blue: 164/255), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text(eventViewModel.event.day ?? ""))
                Text(eventViewModel.event.hourAndMinutes ?? "")
                Spacer()
            }
            .frame(width: 60)
            .font(.custom("Merriweather-Regular", size: 20, relativeTo: .body))
            .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text(eventViewModel.event.bandName ?? "")
                    .font(.custom("Merriweather-Regular", size: 20, relativeTo: .body))
                Text(eventViewModel.event.title ?? "")
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                    Text(eventViewModel.event.address?.label ?? "Chez moi")
                }
                Spacer()
            }
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
        }
    }
}

//struct EventCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventRowView(viewModel: EventViewModel(startEvent: "23", endEvent: "24", description: "Promo radio", bandName: "Sevdaliza", duration: 30, timeSlot: nil, eventId: "123"))
//    }
//}
