
import SwiftUI

struct MainView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    @ObservedObject var userViewModel: UserViewModel
    
    init(with userViewModel: UserViewModel){
        
        self.userViewModel = userViewModel
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 255/255, green: 203/255, blue: 164/255)), NSAttributedString.Key.font: UIFont(name: "KoHo-SemiBold", size: 20)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 255/255, green: 203/255, blue: 164/255)), NSAttributedString.Key.font: UIFont(name: "KoHo-SemiBold", size: 35)!]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        TabView {
            InterviewsView(userViewModel: userViewModel)
                .tabItem { Label("Interviews", systemImage: "calendar") }
            EventsView(userViewModel: userViewModel)
                .tabItem { Label("Events", systemImage: "ticket") }
        }
        .accentColor(Color(red: 255/255, green: 203/255, blue: 164/255))
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
