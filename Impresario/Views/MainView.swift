
import SwiftUI

struct MainView: View {
    let coloredNavAppearance = UINavigationBarAppearance()

    init(){
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 15)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 25)!]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
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
