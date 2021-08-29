
import SwiftUI

struct MainView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    @ObservedObject var userViewModel: UserViewModel

    init(with userViewModel: UserViewModel){
        
        self.userViewModel = userViewModel
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white

        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 20)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 35)!]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance

    }
    
    var body: some View {
        TabView {
            ReminderView(userViewModel: userViewModel)
                .tabItem { Label("Interviews", systemImage: "calendar") }
                                        
            EventsView(userViewModel: userViewModel)
                .tabItem { Label("Events", systemImage: "ticket") }
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
