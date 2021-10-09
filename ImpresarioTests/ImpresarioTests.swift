
import XCTest
@testable import Impresario

class ImpresarioTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testCancelEvent() throws {
//    }
//
//    func testCancelInterview() throws {
//    }
//
//    func testCreateEvent() throws {
//    }
//
//    func testLogin() throws {
//    }
    
    func testGetEvents() throws {
        APIManager.shared.client = MockAPIGraphQLClient()
        
        let eventsViewModel = EventsViewModel()
        eventsViewModel.getEvents {}
        
        XCTAssertEqual(eventsViewModel.events.count, 3)
        XCTAssertEqual(eventsViewModel.events[0].id, "07174c10-1af0-11ec-9988-0242ac170005")
    }
    
    func testGetInterviews() throws {
        APIManager.shared.client = MockAPIGraphQLClient()
        
        let interviewsViewModel = InterviewsViewModel()
        interviewsViewModel.getInterviews {}
        
        XCTAssertEqual(interviewsViewModel.interviews.count, 1)
        XCTAssertEqual(interviewsViewModel.interviews[0].id, "072038ac-1af0-11ec-95e7-0242ac170005")
    }
    
    func testGetUser() throws {
        APIManager.shared.client = MockAPIGraphQLClient()
        
        let userViewModel = UserViewModel()
        userViewModel.getUser()
        
        XCTAssertEqual(userViewModel.user.email, "contact+louislepron@appsolument.com")
    }
    
//    func testRequestInterview() throws {
//    }
}
