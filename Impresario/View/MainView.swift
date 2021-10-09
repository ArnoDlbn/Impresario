
import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var eventsViewModel = EventsViewModel()
    @StateObject var interviewsViewModel = InterviewsViewModel()
    
    let coloredNavAppearance = UINavigationBarAppearance()
    
    
    init(){
        
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 255/255, green: 203/255, blue: 164/255)), NSAttributedString.Key.font: UIFont(name: "KoHo-SemiBold", size: 20)!]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 255/255, green: 203/255, blue: 164/255)), NSAttributedString.Key.font: UIFont(name: "KoHo-SemiBold", size: 35)!]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        TabView {
            InterviewsView()
                .tabItem { Label("Interviews", systemImage: "calendar") }
            EventsView()
                .tabItem { Label("Events", systemImage: "ticket") }
        }
        .accentColor(Color(red: 255/255, green: 203/255, blue: 164/255))
        .environmentObject(eventsViewModel)
        .environmentObject(interviewsViewModel)
    }
}
