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
  public init(bandId: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil, endsAt: Swift.Optional<String?> = nil, interviewDuration: Swift.Optional<Int?> = nil, physicalAddress: Swift.Optional<PhysicalAddressInput?> = nil, startsAt: Swift.Optional<String?> = nil, title: Swift.Optional<String?> = nil, virtualAddress: Swift.Optional<VirtualAddressInput?> = nil) {
    graphQLMap = ["bandId": bandId, "description": description, "endsAt": endsAt, "interviewDuration": interviewDuration, "physicalAddress": physicalAddress, "startsAt": startsAt, "title": title, "virtualAddress": virtualAddress]
  }

  public var bandId: Swift.Optional<String?> {
    get {
      return graphQLMap["bandId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
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

  public var endsAt: Swift.Optional<String?> {
    get {
      return graphQLMap["endsAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
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

  public var startsAt: Swift.Optional<String?> {
    get {
      return graphQLMap["startsAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startsAt")
    }
  }

  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
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

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($input: Credentials!) {
      login(input: $input) {
        __typename
        token
        user {
          __typename
          email
        }
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
        GraphQLField("login", arguments: ["input": GraphQLVariable("input")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Session"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Session", "token": token, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String, firstName: String, lastName: String) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email, "firstName": firstName, "lastName": lastName])
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
            planner {
              __typename
              firstName
              lastName
            }
            physicalAddress {
              __typename
              street
              city
            }
            virtualAddress {
              __typename
              url
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
              GraphQLField("startsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("endsAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("band", type: .nonNull(.object(Band.selections))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("planner", type: .nonNull(.object(Planner.selections))),
              GraphQLField("physicalAddress", type: .object(PhysicalAddress.selections)),
              GraphQLField("virtualAddress", type: .object(VirtualAddress.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, startsAt: String, endsAt: String, band: Band, description: String? = nil, planner: Planner, physicalAddress: PhysicalAddress? = nil, virtualAddress: VirtualAddress? = nil) {
            self.init(unsafeResultMap: ["__typename": "Event", "id": id, "startsAt": startsAt, "endsAt": endsAt, "band": band.resultMap, "description": description, "planner": planner.resultMap, "physicalAddress": physicalAddress.flatMap { (value: PhysicalAddress) -> ResultMap in value.resultMap }, "virtualAddress": virtualAddress.flatMap { (value: VirtualAddress) -> ResultMap in value.resultMap }])
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

          public var planner: Planner {
            get {
              return Planner(unsafeResultMap: resultMap["planner"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "planner")
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

          public struct Planner: GraphQLSelectionSet {
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

          public struct PhysicalAddress: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PhysicalAddress"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("street", type: .nonNull(.scalar(String.self))),
                GraphQLField("city", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(street: String, city: String) {
              self.init(unsafeResultMap: ["__typename": "PhysicalAddress", "street": street, "city": city])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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
        GraphQLField("createEvent", arguments: ["input": GraphQLVariable("input")], type: .object(CreateEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEvent": createEvent.flatMap { (value: CreateEvent) -> ResultMap in value.resultMap }])
    }

    public var createEvent: CreateEvent? {
      get {
        return (resultMap["createEvent"] as? ResultMap).flatMap { CreateEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createEvent")
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
