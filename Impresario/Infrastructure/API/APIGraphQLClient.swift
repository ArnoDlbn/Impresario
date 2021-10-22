
import Foundation
import Apollo

class APIGraphQlClient: APIClientProtocol
{
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.impresarioapp.com")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    func buildEventFromEventDetails(_ content: EventDetails) -> Event {
            let timeSlot: [TimeSlot] = content.timeSlots!.map { timeSlot in
                let result = TimeSlot.init(startsAt: timeSlot!.startsAt, isAvailable: timeSlot!.isAvailable)
                return result
            }
            
            let firstAddress: PhysicalAddress?
            if let physicalAddress = content.physicalAddress {
                firstAddress = PhysicalAddress(label: physicalAddress.label, street: physicalAddress.street, zipCode: physicalAddress.zipCode, city: physicalAddress.city, countryCode: physicalAddress.countryCode)
            } else {
                firstAddress = nil
            }
            
            let secondAddress: VirtualAddress?
            if let virtualAddress = content.virtualAddress {
                secondAddress = VirtualAddress(label: virtualAddress.label, url: virtualAddress.url)
            } else {
                secondAddress = nil
            }
            
            return Event(
                startsAt: content.startsAt,
                endsAt: content.endsAt,
                title: content.title,
                description: content.description,
                bandName: content.band.name,
                duration: content.interviewDuration,
                timeSlot: timeSlot,
                id: content.id,
                physicalAddress: firstAddress,
                virtualAddress: secondAddress
            )
        }
    
    func buildInterviewFromInterview(_ content: InterviewsQuery.Data.Interview.Edge.Node) -> Interview {
        let startsAt = content.startsAt
        let endsAt = content.endsAt
        let event = self.buildEventFromEventDetails(content.event.fragments.eventDetails)
        let id = content.id
        
        return Interview(startsAt: startsAt, endsAt: endsAt, event: event, id: id)
    }
    
    func cancelEvent(eventId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        self.apollo.perform(mutation: CancelEventMutation(input: CanceledEventInput(eventId: eventId))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
                successHandler()
            case .failure(let error):
                debugPrint(error)
                errorHandler()
            }
        }
    }
    
    func cancelInterview(interviewId: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        self.apollo.perform(mutation: CancelInterviewMutation(input: CanceledInterviewInput(interviewId: interviewId))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
                successHandler()
            case .failure(let error):
                debugPrint(error)
                errorHandler()
            }
        }
    }
    
    func createEvent(
        title: String,
        description: String,
        startsAt: String,
        endsAt: String,
        label: String,
        street: String,
        zipCode: String,
        city: String,
        countryCode: String,
        virtualLabel: String,
        url: String,
        validatesInterviewRequestAutomatically: Bool,
        successHandler: @escaping () -> Void,
        errorHandler: @escaping () -> Void) {
            self.apollo.perform(
                mutation: CreateEventMutation(
                    input: EventInput(
                        description: description,
                        endsAt: endsAt,
                        physicalAddress: PhysicalAddressInput(
                            city: city,
                            countryCode: countryCode,
                            label: label,
                            street: street,
                            zipCode: zipCode),
                        startsAt: startsAt,
                        title: title,
                        validatesInterviewRequestAutomatically: validatesInterviewRequestAutomatically,
                        virtualAddress: VirtualAddressInput(
                            label: virtualLabel,
                            url: url
                        )
                    )
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    debugPrint(graphQLResult.data ?? "")
                    debugPrint(graphQLResult.errors ?? "")
                    successHandler()
                case .failure(let error):
                    debugPrint(error)
                    errorHandler()
                }
            }
        }
    
    func getEvents(successHandler: @escaping ([Event]) -> (), errorHandler: @escaping () -> ()) {
        self.apollo.fetch(query: EventsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let edges = graphQLResult.data?.events?.edges {
                    var events: [Event] = []
                    for edge in edges {
                        if let e = edge {
                            let event = self.buildEventFromEventDetails(e.node.fragments.eventDetails)
                            events.append(event)
                        }
                    }
                    successHandler(events)
                } else {
                    print(graphQLResult.errors.debugDescription)
                    print(graphQLResult.errors?.description ?? "rien")
                    graphQLResult.errors.map { error in
                        print("1")
                        print(error.description)
                    }
                    errorHandler()
                }
            case .failure(let error):
                print("2")
                print(error.localizedDescription)
                errorHandler()
            }
        }
    }
    
    func getInterviews(successHandler: @escaping ([Interview]) -> (), errorHandler: @escaping () -> ()) {
        self.apollo.fetch(query: InterviewsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let edges = graphQLResult.data?.interviews?.edges {
                    var interviews: [Interview] = []
                    for edge in edges {
                        if let e = edge {
                            let interview = self.buildInterviewFromInterview(e.node)
                            interviews.append(interview)
                        }
                    }
                    successHandler(interviews)
                } else {
                    print(graphQLResult.errors.debugDescription)
                    print(graphQLResult.errors?.description ?? "rien")
                    graphQLResult.errors.map { error in
                        print("1")
                        print(error.description)
                    }
                    errorHandler()
                }
            case .failure(let error):
                print("2")
                print(error.localizedDescription)
                errorHandler()
            }
        }
    }
    
    func getUser(successHandler: @escaping (User) -> Void, errorHandler: @escaping () -> Void) {
        self.apollo.fetch(query: MeQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.me {
                    var user: User = User()
                    user.email = result.email
                    user.firstName = result.firstName
                    user.lastName = result.lastName
                    user.isArtist = result.isArtist
                    user.isJournalist = result.isJournalist
                    successHandler(user)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    errorHandler()
                }
            case .failure(let error):
                print(error)
                errorHandler()
            }
        }
    }
    
    func login(email: String, password: String, successHandler: @escaping (String) -> Void, errorHandler: @escaping () -> Void) {
        self.apollo.perform(mutation: LoginMutation(input: Credentials(email: email, password: password))) { result in
            switch result {
            case .success(let graphQLResult):
                if let result = graphQLResult.data?.login.token {
                    successHandler(result)
                } else {
                    graphQLResult.errors.map { error in
                        print(error.description)
                    }
                    errorHandler()
                }
            case .failure:
                errorHandler()
            }
        }
    }
    
    func requestInterview(eventId: String, startsAt: String, successHandler: @escaping () -> Void, errorHandler: @escaping () -> Void) {
        self.apollo.perform(mutation: RequestInterviewMutation(input: InterviewRequestInput(eventId: eventId, startsAt: startsAt))) { result in
            switch result {
            case .success(let graphQLResult):
                debugPrint(graphQLResult.data ?? "")
                debugPrint(graphQLResult.errors ?? "")
                successHandler()
            case .failure(let error):
                debugPrint(error)
                errorHandler()
            }
        }
    }
}


