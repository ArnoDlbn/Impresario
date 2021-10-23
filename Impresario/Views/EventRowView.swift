
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
                Text(eventViewModel.event.month ?? "")
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
                    if let physicalAddress = eventViewModel.event.physicalAddress {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                        Text(physicalAddress.label ?? physicalAddress.city)
                    } else if let virtualAddress = eventViewModel.event.virtualAddress {
                        Image(systemName: "video")
                            .foregroundColor(Color(red: 255/255, green: 203/255, blue: 164/255))
                        Text(virtualAddress.label ?? "Virtual meeting")
                    }
                }
                Spacer()
            }
            .font(.custom("Merriweather-Regular", size: 15, relativeTo: .body))
        }
    }
}
