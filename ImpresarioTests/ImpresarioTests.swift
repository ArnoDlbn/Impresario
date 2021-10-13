
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
    
    func testEventExtension() throws {
        
        let event = Event(startEvent: "2021-12-21T09:00:00+00:00",
                          endEvent: "2021-12-21T12:30:00+00:00",
                          id: "07174c10-1af0-11ec-9988-0242ac170005")
        
        XCTAssertEqual(event.fullStartDate, "21/12/2021 at 9:00")
        XCTAssertEqual(event.fullEndDate, "21/12/2021 at 12:30")
        XCTAssertEqual(event.day, "21")
        XCTAssertEqual(event.hourAndMinutes, "9:00")
    }
    
    func testInterviewExtension() throws {
        
        let interview = Interview(startsAt: "2021-12-21T12:00:00+00:00",
                                  endsAt: "2021-12-21T12:15:00+00:00",
                                  event: Event(id: "07174c10-1af0-11ec-9988-0242ac170005"),
                                  id: "072038ac-1af0-11ec-95e7-0242ac170005")
        
        XCTAssertEqual(interview.fullStartDate, "21/12/2021 at 12:00")
        XCTAssertEqual(interview.fullEndDate, "21/12/2021 at 12:15")
        XCTAssertEqual(interview.day, "21")
        XCTAssertEqual(interview.hourAndMinutes, "12:00")
    }
    
    func testTimeSlotExtension() throws {
        
        let timeSlot = TimeSlot(startsAt: "2021-12-21T09:00:00+00:00",
                                isAvailable: true)
        
        XCTAssertEqual(timeSlot.hourAndMinutes, "9:00")
    }
}
