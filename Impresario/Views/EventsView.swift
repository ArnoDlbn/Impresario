
import SwiftUI

struct EventsView: View {
    
    @EnvironmentObject var eventsViewModel: EventsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var isAddEvent = false
    @State private var isViewProfile = false
    @State private var activeSheet: SheetIdentifier?
    
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
                NavigationLink(destination: EventDetailView(eventViewModel: EventViewModel(withEvent: event))) {
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
                        .isHidden(userViewModel.user.isJournalist)
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
        .sheet(item: $activeSheet) { item in
            switch item.id {
            case .add:
                AddEventView()
            case .profile:
                ProfileView()
            }
        }
        .onAppear(perform: {
            debugPrint("On appear Events view")
            loadEvents()
        })
    }
    
    func loadEvents() {
        debugPrint("Load events")
        eventsViewModel.getEvents() {
            userViewModel.logOut()
        }
    }
}
