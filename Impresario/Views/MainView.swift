
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ReminderView()
                .tabItem { Label("Reminder", systemImage: "calendar") }
                                        
            EventsView()
                .tabItem { Label("Events", systemImage: "ticket") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
