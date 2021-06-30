
import SwiftUI

struct EventDatesView: View {
    @State private var eventStart = Date()
    @State private var eventEnd = Date()
    @State private var interviewDuration = Int()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventDatesView_Previews: PreviewProvider {
    static var previews: some View {
        EventDatesView()
    }
}
