// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct Credentials: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct Registration: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - firstName
  ///   - lastName
  ///   - password
  public init(email: String, firstName: String, lastName: String, password: String) {
    graphQLMap = ["email": email, "firstName": firstName, "lastName": lastName, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct EventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - bandId
  ///   - description
  ///   - endsAt
  ///   - interviewDuration
  ///   - physicalAddress
  ///   - startsAt
  ///   - title
  ///   - virtualAddress
  public init(bandId: Swift.Optional<GraphQLID?> = nil, description: Swift.Optional<String?> = nil, endsAt: String, interviewDuration: Swift.Optional<Int?> = nil, physicalAddress: Swift.Optional<PhysicalAddressInput?> = nil, startsAt: String, title: String, virtualAddress: Swift.Optional<VirtualAddressInput?> = nil) {
    graphQLMap = ["bandId": bandId, "description": description, "endsAt": endsAt, "interviewDuration": interviewDuration, "physicalAddress": physicalAddress, "startsAt": startsAt, "title": title, "virtualAddress": virtualAddress]
  }

  public var bandId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["bandId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bandId")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var endsAt: String {
    get {
      return graphQLMap["endsAt"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endsAt")
    }
  }

  public var interviewDuration: Swift.Optional<Int?> {
    get {
      return graphQLMap["interviewDuration"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "interviewDuration")
    }
  }

  public var physicalAddress: Swift.Optional<PhysicalAddressInput?> {
    get {
      return graphQLMap["physicalAddress"] as? Swift.Optional<PhysicalAddressInput?> ?? Swift.Optional<PhysicalAddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "physicalAddress")
    }
  }

  public var startsAt: String {
    get {
      return graphQLMap["startsAt"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startsAt")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var virtualAddress: Swift.Optional<VirtualAddressInput?> {
    get {
      return graphQLMap["virtualAddress"] as? Swift.Optional<VirtualAddressInput?> ?? Swift.Optional<VirtualAddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "virtualAddress")
    }
  }
}

public struct PhysicalAddressInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - city
  ///   - countryCode
  ///   - label
  ///   - street
  ///   - zipCode
  public init(city: String, countryCode: String, label: Swift.Optional<String?> = nil, street: String, zipCode: String) {
    graphQLMap = ["city": city, "countryCode": countryCode, "label": label, "street": street, "zipCode": zipCode]
  }

  public var city: String {
    get {
      return graphQLMap["city"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  public var countryCode: String {
    get {
      return graphQLMap["countryCode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "countryCode")
    }
  }

  public var label: Swift.Optional<String?> {
    get {
      return graphQLMap["label"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "label")
    }
  }

  public var street: String {
    get {
      return graphQLMap["street"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "street")
    }
  }

  public var zipCode: String {
    get {
      return graphQLMap["zipCode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipCode")
    }
  }
}

public struct VirtualAddressInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - label
  ///   - url
  public init(label: Swift.Optional<String?> = nil, url: String) {
    graphQLMap = ["label": label, "url": url]
  }

  public var label: Swift.Optional<String?> {
    get {
      return graphQLMap["label"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "label")
    }
  }

  public var url: String {
    get {
      return graphQLMap["url"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url")
    }
  }
}

public struct InterviewRequestInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - duration
  ///   - eventId
  ///   - mediumId
  ///   - startsAt
  public init(duration: Swift.Optional<Int?> = nil, eventId: GraphQLID, mediumId: Swift.Optional<GraphQLID?> = nil, startsAt: String) {
    graphQLMap = ["duration": duration, "eventId": eventId, "mediumId": mediumId, "startsAt": startsAt]
  }

  public var duration: Swift.Optional<Int?> {
    get {
      return graphQLMap["duration"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "duration")
    }
  }

  public var eventId: GraphQLID {
    get {
      return graphQLMap["eventId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var mediumId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["mediumId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mediumId")
    }
  }

  public var startsAt: String {
    get {
      return graphQLMap["startsAt"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startsAt")
    }
  }
}

public struct CanceledEventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - eventId
  ///   - description
  public init(eventId: GraphQLID, description: Swift.Optional<String?> = nil) {
    graphQLMap = ["eventId": eventId, "description": description]
  }

  public var eventId: GraphQLID {
    get {
      return graphQLMap["eventId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public struct CanceledInterviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - description
  ///   - interviewId
  public init(description: Swift.Optional<String?> = nil, interviewId: GraphQLID) {
    graphQLMap = ["description": description, "interviewId": interviewId]
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var interviewId: GraphQLID {
    get {
      return graphQLMap["interviewId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "interviewId")
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($input: Credentials!) {
      login(input: $input) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "login"

  public var input: Credentials

  public init(input: Credentials) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Session"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "Session", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation signup($input: Registration!) {
      signup(input: $input) {
        __typename
        email
      }
    }
    """

  public let operationName: String = "signup"

  public var input: Registration

  public init(input: Registration) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["input": GraphQLVariable("input")], type: .object(Signup.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.flatMap { (value: Signup) -> ResultMap in value.resultMap }])
    }

    public var signup: Signup? {
      get {
        return (resultMap["signup"] as? ResultMap).flatMap { Signup(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query me {
      me {
        __typename
        email
        firstName
        lastName
        isJournalist
        isArtist
      }
    }
    """

  public let operationName: String = "me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("isJournalist", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("isArtist", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String, firstName: String, lastName: String, isJournalist: Bool, isArtist: Bool) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "firstName": firstName, "lastName": lastName, "isJournalist": isJournalist, "isArtist": isArtist])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var isJournalist: Bool {
        get {
          return resultMap["isJournalist"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isJournalist")
        }
      }

      public var isArtist: Bool {
        get {
          return resultMap["isArtist"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isArtist")
        }
      }
    }
  }
}

public final class EventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query events {
      events {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            id
            author {
              __typename
              firstName
              lastName
            }
            startsAt
            endsAt
            band {
              __typename
              name
              artists {
                __typename
                name
              }
            }
            description
            physicalAddress {
              __typename
              label
              street
              city
              zipCode
            }
            virtualAddress {
              __typename
              url
            }
            interviewDuration
            timeSlots {
              __typename
              startsAt
              isAvailable
            }
          }
        }
      }
    }
    """

  public let operationName: String = "events"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events", type: .object(Event.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(events: Event? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "events": events.flatMap { (value: Event) -> ResultMap in value.resultMap }])
    }

    public var events: Event? {
      get {
        return (resultMap["events"] as? ResultMap).flatMap { Event(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "events")
      }
    }

    public struct Event: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EventEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "EventEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Event"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("author", type: .nonNull(.object(Author.selections))),
              GraphQLField("startsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("endsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("band", type: .nonNull(.object(Band.selections))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("physicalAddress", type: .object(PhysicalAddress.selections)),
              GraphQLField("virtualAddress", type: .object(VirtualAddress.selections)),
              GraphQLField("interviewDuration", type: .nonNull(.scalar(Int.self))),
              GraphQLField("timeSlots", type: .list(.object(TimeSlot.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, author: Author, startsAt: String, endsAt: String, band: Band, description: String? = nil, physicalAddress: PhysicalAddress? = nil, virtualAddress: VirtualAddress? = nil, interviewDuration: Int, timeSlots: [TimeSlot?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Event", "id": id, "author": author.resultMap, "startsAt": startsAt, "endsAt": endsAt, "band": band.resultMap, "description": description, "physicalAddress": physicalAddress.flatMap { (value: PhysicalAddress) -> ResultMap in value.resultMap }, "virtualAddress": virtualAddress.flatMap { (value: VirtualAddress) -> ResultMap in value.resultMap }, "interviewDuration": interviewDuration, "timeSlots": timeSlots.flatMap { (value: [TimeSlot?]) -> [ResultMap?] in value.map { (value: TimeSlot?) -> ResultMap? in value.flatMap { (value: TimeSlot) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var author: Author {
            get {
              return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "author")
            }
          }

          public var startsAt: String {
            get {
              return resultMap["startsAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startsAt")
            }
          }

          public var endsAt: String {
            get {
              return resultMap["endsAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endsAt")
            }
          }

          public var band: Band {
            get {
              return Band(unsafeResultMap: resultMap["band"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "band")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var physicalAddress: PhysicalAddress? {
            get {
              return (resultMap["physicalAddress"] as? ResultMap).flatMap { PhysicalAddress(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "physicalAddress")
            }
          }

          public var virtualAddress: VirtualAddress? {
            get {
              return (resultMap["virtualAddress"] as? ResultMap).flatMap { VirtualAddress(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "virtualAddress")
            }
          }

          public var interviewDuration: Int {
            get {
              return resultMap["interviewDuration"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "interviewDuration")
            }
          }

          public var timeSlots: [TimeSlot?]? {
            get {
              return (resultMap["timeSlots"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TimeSlot?] in value.map { (value: ResultMap?) -> TimeSlot? in value.flatMap { (value: ResultMap) -> TimeSlot in TimeSlot(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [TimeSlot?]) -> [ResultMap?] in value.map { (value: TimeSlot?) -> ResultMap? in value.flatMap { (value: TimeSlot) -> ResultMap in value.resultMap } } }, forKey: "timeSlots")
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
                GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(firstName: String, lastName: String) {
              self.init(unsafeResultMap: ["__typename": "User", "firstName": firstName, "lastName": lastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var firstName: String {
              get {
                return resultMap["firstName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String {
              get {
                return resultMap["lastName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }
          }

          public struct Band: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Band"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("artists", type: .list(.object(Artist.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, artists: [Artist?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "Band", "name": name, "artists": artists.flatMap { (value: [Artist?]) -> [ResultMap?] in value.map { (value: Artist?) -> ResultMap? in value.flatMap { (value: Artist) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var artists: [Artist?]? {
              get {
                return (resultMap["artists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Artist?] in value.map { (value: ResultMap?) -> Artist? in value.flatMap { (value: ResultMap) -> Artist in Artist(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Artist?]) -> [ResultMap?] in value.map { (value: Artist?) -> ResultMap? in value.flatMap { (value: Artist) -> ResultMap in value.resultMap } } }, forKey: "artists")
              }
            }

            public struct Artist: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Artist"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Artist", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct PhysicalAddress: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PhysicalAddress"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("label", type: .scalar(String.self)),
                GraphQLField("street", type: .nonNull(.scalar(String.self))),
                GraphQLField("city", type: .nonNull(.scalar(String.self))),
                GraphQLField("zipCode", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(label: String? = nil, street: String, city: String, zipCode: String) {
              self.init(unsafeResultMap: ["__typename": "PhysicalAddress", "label": label, "street": street, "city": city, "zipCode": zipCode])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var label: String? {
              get {
                return resultMap["label"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "label")
              }
            }

            public var street: String {
              get {
                return resultMap["street"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "street")
              }
            }

            public var city: String {
              get {
                return resultMap["city"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "city")
              }
            }

            public var zipCode: String {
              get {
                return resultMap["zipCode"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "zipCode")
              }
            }
          }

          public struct VirtualAddress: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["VirtualAddress"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String) {
              self.init(unsafeResultMap: ["__typename": "VirtualAddress", "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct TimeSlot: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["TimeSlot"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("startsAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("isAvailable", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(startsAt: String, isAvailable: Bool) {
              self.init(unsafeResultMap: ["__typename": "TimeSlot", "startsAt": startsAt, "isAvailable": isAvailable])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var startsAt: String {
              get {
                return resultMap["startsAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startsAt")
              }
            }

            public var isAvailable: Bool {
              get {
                return resultMap["isAvailable"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isAvailable")
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createEvent($input: EventInput!) {
      createEvent(input: $input) {
        __typename
        id
        description
      }
    }
    """

  public let operationName: String = "createEvent"

  public var input: EventInput

  public init(input: EventInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createEvent", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreateEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEvent": createEvent.resultMap])
    }

    public var createEvent: CreateEvent {
      get {
        return CreateEvent(unsafeResultMap: resultMap["createEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createEvent")
      }
    }

    public struct CreateEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}

public final class InterviewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query interviews {
      interviews {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            id
            startsAt
            endsAt
            event {
              __typename
              id
              description
              band {
                __typename
                name
              }
              physicalAddress {
                __typename
                label
                street
                city
                zipCode
              }
              virtualAddress {
                __typename
                url
              }
            }
            journalist {
              __typename
              medium {
                __typename
                name
              }
              user {
                __typename
                firstName
                lastName
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "interviews"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("interviews", type: .object(Interview.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(interviews: Interview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "interviews": interviews.flatMap { (value: Interview) -> ResultMap in value.resultMap }])
    }

    public var interviews: Interview? {
      get {
        return (resultMap["interviews"] as? ResultMap).flatMap { Interview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "interviews")
      }
    }

    public struct Interview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["InterviewConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "InterviewConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["InterviewEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "InterviewEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Interview"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("startsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("endsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("event", type: .nonNull(.object(Event.selections))),
              GraphQLField("journalist", type: .nonNull(.object(Journalist.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, startsAt: String, endsAt: String, event: Event, journalist: Journalist) {
            self.init(unsafeResultMap: ["__typename": "Interview", "id": id, "startsAt": startsAt, "endsAt": endsAt, "event": event.resultMap, "journalist": journalist.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var startsAt: String {
            get {
              return resultMap["startsAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startsAt")
            }
          }

          public var endsAt: String {
            get {
              return resultMap["endsAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endsAt")
            }
          }

          public var event: Event {
            get {
              return Event(unsafeResultMap: resultMap["event"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "event")
            }
          }

          public var journalist: Journalist {
            get {
              return Journalist(unsafeResultMap: resultMap["journalist"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "journalist")
            }
          }

          public struct Event: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Event"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("description", type: .scalar(String.self)),
                GraphQLField("band", type: .nonNull(.object(Band.selections))),
                GraphQLField("physicalAddress", type: .object(PhysicalAddress.selections)),
                GraphQLField("virtualAddress", type: .object(VirtualAddress.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, description: String? = nil, band: Band, physicalAddress: PhysicalAddress? = nil, virtualAddress: VirtualAddress? = nil) {
              self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "band": band.resultMap, "physicalAddress": physicalAddress.flatMap { (value: PhysicalAddress) -> ResultMap in value.resultMap }, "virtualAddress": virtualAddress.flatMap { (value: VirtualAddress) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var description: String? {
              get {
                return resultMap["description"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }

            public var band: Band {
              get {
                return Band(unsafeResultMap: resultMap["band"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "band")
              }
            }

            public var physicalAddress: PhysicalAddress? {
              get {
                return (resultMap["physicalAddress"] as? ResultMap).flatMap { PhysicalAddress(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "physicalAddress")
              }
            }

            public var virtualAddress: VirtualAddress? {
              get {
                return (resultMap["virtualAddress"] as? ResultMap).flatMap { VirtualAddress(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "virtualAddress")
              }
            }

            public struct Band: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Band"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Band", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct PhysicalAddress: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PhysicalAddress"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("label", type: .scalar(String.self)),
                  GraphQLField("street", type: .nonNull(.scalar(String.self))),
                  GraphQLField("city", type: .nonNull(.scalar(String.self))),
                  GraphQLField("zipCode", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(label: String? = nil, street: String, city: String, zipCode: String) {
                self.init(unsafeResultMap: ["__typename": "PhysicalAddress", "label": label, "street": street, "city": city, "zipCode": zipCode])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var label: String? {
                get {
                  return resultMap["label"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "label")
                }
              }

              public var street: String {
                get {
                  return resultMap["street"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "street")
                }
              }

              public var city: String {
                get {
                  return resultMap["city"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "city")
                }
              }

              public var zipCode: String {
                get {
                  return resultMap["zipCode"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "zipCode")
                }
              }
            }

            public struct VirtualAddress: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["VirtualAddress"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String) {
                self.init(unsafeResultMap: ["__typename": "VirtualAddress", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }
          }

          public struct Journalist: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Journalist"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("medium", type: .nonNull(.object(Medium.selections))),
                GraphQLField("user", type: .nonNull(.object(User.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(medium: Medium, user: User) {
              self.init(unsafeResultMap: ["__typename": "Journalist", "medium": medium.resultMap, "user": user.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var medium: Medium {
              get {
                return Medium(unsafeResultMap: resultMap["medium"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "medium")
              }
            }

            public var user: User {
              get {
                return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "user")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Medium"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Medium", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
                  GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(firstName: String, lastName: String) {
                self.init(unsafeResultMap: ["__typename": "User", "firstName": firstName, "lastName": lastName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var firstName: String {
                get {
                  return resultMap["firstName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "firstName")
                }
              }

              public var lastName: String {
                get {
                  return resultMap["lastName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "lastName")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class RequestInterviewMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation requestInterview($input: InterviewRequestInput!) {
      requestInterview(input: $input) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "requestInterview"

  public var input: InterviewRequestInput

  public init(input: InterviewRequestInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("requestInterview", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(RequestInterview.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestInterview: RequestInterview) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "requestInterview": requestInterview.resultMap])
    }

    public var requestInterview: RequestInterview {
      get {
        return RequestInterview(unsafeResultMap: resultMap["requestInterview"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "requestInterview")
      }
    }

    public struct RequestInterview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["InterviewRequest"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "InterviewRequest", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class CancelEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation cancelEvent($input: CanceledEventInput!) {
      cancelEvent(input: $input) {
        __typename
        id
        description
      }
    }
    """

  public let operationName: String = "cancelEvent"

  public var input: CanceledEventInput

  public init(input: CanceledEventInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelEvent", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CancelEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelEvent: CancelEvent) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelEvent": cancelEvent.resultMap])
    }

    public var cancelEvent: CancelEvent {
      get {
        return CancelEvent(unsafeResultMap: resultMap["cancelEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "cancelEvent")
      }
    }

    public struct CancelEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CanceledEvent"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "CanceledEvent", "id": id, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}

public final class CancelInterviewMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation cancelInterview($input: CanceledInterviewInput!) {
      cancelInterview(input: $input) {
        __typename
        id
        description
      }
    }
    """

  public let operationName: String = "cancelInterview"

  public var input: CanceledInterviewInput

  public init(input: CanceledInterviewInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelInterview", arguments: ["input": GraphQLVariable("input")], type: .object(CancelInterview.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelInterview: CancelInterview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelInterview": cancelInterview.flatMap { (value: CancelInterview) -> ResultMap in value.resultMap }])
    }

    public var cancelInterview: CancelInterview? {
      get {
        return (resultMap["cancelInterview"] as? ResultMap).flatMap { CancelInterview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "cancelInterview")
      }
    }

    public struct CancelInterview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CanceledInterview"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "CanceledInterview", "id": id, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}
