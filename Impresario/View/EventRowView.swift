
import SwiftUI

struct EventRowView: View {
    
    let eventViewModel: EventViewModel
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.init(.darkGray), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text(eventViewModel.event.day ?? ""))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.init(.darkGray))
                Text(eventViewModel.event.hourAndMinutes ?? "")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
            }
            Spacer()
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(eventViewModel.event.bandName ?? "")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.init(.darkGray))
                Text(eventViewModel.event.description!)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
                VStack(alignment: .leading) {
                    Text(eventViewModel.event.address?.label ?? "Chez moi")
                    Text(eventViewModel.event.address?.street ?? "9 rue Huntziger")
                    HStack {
                        Text(eventViewModel.event.address?.zipCode ?? "92110")
                        Text(eventViewModel.event.address?.city ?? "Clichy")
                    }
                }
                .font(.system(size: 15))
                .foregroundColor(Color.init(.darkGray))
            }
            .foregroundColor(Color.init(.darkGray))
            Spacer()
        }
    }
}

//struct EventCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventRowView(viewModel: EventViewModel(startEvent: "23", endEvent: "24", description: "Promo radio", bandName: "Sevdaliza", duration: 30, timeSlot: nil, eventId: "123"))
//    }
//}
