
import SwiftUI

struct EventRowView: View {
    let viewModel: EventViewModel
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.init(.darkGray), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text(viewModel.startEvent)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.init(.darkGray))
                    )
                Text(" 08 : 30 ")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.init(.darkGray))
            }
            Spacer()
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(viewModel.bandName)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.init(.darkGray))
                Text(viewModel.description!)
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

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(viewModel: EventViewModel(startEvent: "23", endEvent: "24", description: "Promo radio", bandName: "Sevdaliza", duration: 30, timeSlot: nil))
    }
}
