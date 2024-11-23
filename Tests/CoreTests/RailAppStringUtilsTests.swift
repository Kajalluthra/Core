import XCTest
@testable import Core

class RailAppStringUtilsTests: XCTestCase {
    
    func testBuildPassengersStringWithBothNonZero() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 2, numberOfChildren: 3)
        XCTAssertEqual(result, "2 Adults, 3 Children")
    }
    
    func testBuildPassengersStringWithOnlyAdults() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 2, numberOfChildren: 0)
        XCTAssertEqual(result, "2 Adults")
    }
    
    func testBuildPassengersStringWithOnlyChildren() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 0, numberOfChildren: 3)
        XCTAssertEqual(result, "3 Children")
    }
    
    func testBuildPassengersStringWithSingleAdult() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 1, numberOfChildren: 0)
        XCTAssertEqual(result, "1 Adult")
    }
    
    func testBuildPassengersStringWithSingleChild() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 0, numberOfChildren: 1)
        XCTAssertEqual(result, "1 Child")
    }
    
    func testBuildPassengersStringWithSingleAdultAndChild() {
        let result = RailAppStringUtils.buildPassengersString(numberOfAdults: 1, numberOfChildren: 1)
        XCTAssertEqual(result, "1 Adult, 1 Child")
    }
    
    func testGetChangesAndDurationTextWithNoChangesShouldReturnDirectText() {
        let result = RailAppStringUtils.getChangesAndDurationText(numChanges: 0, duration: "2:30")
        XCTAssertEqual(result, "Direct, 2hr 30m")
    }
    
    func testGetChangesAndDurationTextWithOneChange() {
        let result = RailAppStringUtils.getChangesAndDurationText(numChanges: 1, duration: "2:30")
        XCTAssertEqual(result, "1 Change, 2hr 30m")
    }
    
    func testGetChangesAndDurationTextWithMultipleChanges() {
        let result = RailAppStringUtils.getChangesAndDurationText(numChanges: 3, duration: "2:30")
        XCTAssertEqual(result, "3 Changes, 2hr 30m")
    }
    
    func testGetDurationTextWithLessThanAnHour() {
        let result = RailAppStringUtils.getDurationText(duration: "00:30")
        XCTAssertEqual(result, "30m")
    }
    
    func testGetDurationTextWithMoreThanAnHour() {
        let result = RailAppStringUtils.getDurationText(duration: "2:30")
        XCTAssertEqual(result, "2hr 30m")
    }
    
    func testGetDurationTextWithExactHour() {
        let result = RailAppStringUtils.getDurationText(duration: "1:00")
        XCTAssertEqual(result, "1hr 0m")
    }
    
    func testGetDurationWhenIsLessThanAnHour() {
        let result = RailAppStringUtils.getDuration(fromDate: "10:00", toDate: "10:30")
        XCTAssertEqual(result, "0:30")
    }
    
    func testGetDurationWhenIsMoreThanAnHour() {
        let result = RailAppStringUtils.getDuration(fromDate: "10:00", toDate: "12:30")
        XCTAssertEqual(result, "2:30")
    }
    
    func testGetDurationWhenIsExactHour() {
        let result = RailAppStringUtils.getDuration(fromDate: "10:00", toDate: "11:00")
        XCTAssertEqual(result, "1:0")
    }
    
    func testGetDurationWhenToDateMissing() {
        let result = RailAppStringUtils.getDuration(fromDate: "10:00", toDate: "")
        XCTAssertNotNil(result)
    }
}
