
import SwiftUI

struct EventRowView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.init(.darkGray), lineWidth: 3)
                    .frame(width: 50, height: 50, alignment: .center)
                    .overlay(Text(" 10 ")
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
                Text("Sevdaliza")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.init(.darkGray))
                Text("Promo radio")
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
        EventRowView()
    }
}