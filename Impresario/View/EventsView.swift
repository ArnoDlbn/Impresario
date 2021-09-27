
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
            List(eventsViewModel.events) { event in
                NavigationLink(destination: EventDetailView(eventViewModel: EventViewModel(withEvent: event), userViewModel: userViewModel)) {
                    EventRowView(eventViewModel: EventViewModel(withEvent: event))
                }
            }
            .padding(.leading, -20)
            .listStyle(PlainListStyle())
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ZStack{
                        Button(action: {
                            self.activeSheet = SheetIdentifier(id: .add)
                        }) {
                            Image(systemName: "plus.circle")
                        }
                        .isHidden(isJournalist)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.activeSheet = SheetIdentifier(id: .profile)
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        }
        .onAppear(perform: {
            debugPrint("On appear Events view")
            loadEvents()
        })
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
