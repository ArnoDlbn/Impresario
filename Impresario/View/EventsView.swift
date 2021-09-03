
import SwiftUI

struct EventsView: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()
    @State private var isAddEvent = false
    @State private var isViewProfile = false
    @ObservedObject var userViewModel: UserViewModel
    @State private var activeSheet: SheetIdentifier?
    
    private var isJournalist: Bool {
        if let user = userViewModel.user {
            if user.isJournalist {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private struct SheetIdentifier: Identifiable {
            var id: Choice

            enum Choice {
                case add
                case profile
            }
        }
    
    var body: some View {
        NavigationView {
            VStack {
                List(eventsViewModel.events) { event in
                    NavigationLink(destination: DetailEventView(eventViewModel: EventViewModel(withEvent: event), userViewModel: userViewModel)) {
                        EventRowView(eventViewModel: EventViewModel(withEvent: event))
                    }
                }
                .navigationTitle("Events")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        ZStack{
                        Button(action: {
                            self.activeSheet = SheetIdentifier(id: .add)
                        }) {
                            Image(systemName: "plus.circle")
                        }
                        
//                        Label("AddEvent", systemImage: "plus.circle")
//                            .onTapGesture {
//                                self.activeSheet = SheetIdentifier(id: .add)
//                            }
//                            .foregroundColor(Color.init(.darkGray))
//                            .font(.system(size: 25))
                            .isHidden(isJournalist)
                    }
                        .accentColor(.gray)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.activeSheet = SheetIdentifier(id: .profile)
                        }) {
                            Image(systemName: "person.crop.circle")
                        }
//                        Label("Profile", systemImage: "person.crop.circle")
//                            .onTapGesture {
//                                self.activeSheet = SheetIdentifier(id: .profile)
//                            }
//                            .foregroundColor(Color.init(.darkGray))
//                            .font(.system(size: 25))
                    }
                }
                .accentColor(.gray)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(item: $activeSheet) { item in
            switch item.id {
            case .add:
                AddEventView()
            case .profile:
                ProfileView(userViewModel: userViewModel)
            }
        }
    }
    
    func loadEvents() {
        debugPrint("Load events")
        self.eventsViewModel.eventsQuery() {
            self.userViewModel.logOut()
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsView()
//    }
//}
