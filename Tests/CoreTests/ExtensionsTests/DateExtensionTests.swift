import XCTest
@testable import Core

class DateExtensionTests: XCTestCase {
    
    private var dateFormatter: DateFormatter!
    
    override func setUp() {
        dateFormatter = DateFormatter.getHourAndMinutesFormatter()
    }
    
    override func tearDown() {
        dateFormatter = nil
    }
    
    func testWhenHaveTimeInFirstQuarter_nearestQuarterReturnsQuarterPast() {
        checkEquality(timeToRound: "12:03", expectedTime: "12:15")
    }
    
    func testWhenHaveTimeInSecondQuarter_nearestQuarterReturnsHalfPast() {
        checkEquality(timeToRound: "12:23", expectedTime: "12:30")
    }
    
    func testWhenHaveTimeInThirdQuarter_nearestQuarterReturnsQuarterTo() {
        checkEquality(timeToRound: "12:42", expectedTime: "12:45")
    }
    
    func testWhenHaveTimeInFourthQuarter_nearestQuarterReturnsNextHour() {
        checkEquality(timeToRound: "12:55", expectedTime: "13:00")
    }
    
    func testGivenTimeDifferenceCalled_WhenPassingCloseTime_ReturnsCorrectMinutes() {
        let fromDate = dateFormatter.date(from: "08:00")
        let toTime = dateFormatter.date(from: "08:45") ?? Date()
        let dateComponents = fromDate!.timeDifference(to: toTime)
        XCTAssertEqual(dateComponents.hour, 0)
        XCTAssertEqual(dateComponents.minute, 45)
    }
    
    func testGivenTimeDifferenceCalled_WhenPassingFarTime_ReturnsCorrectHoursAndMinutes() {
        let fromDate = dateFormatter.date(from: "08:00")
        let toTime = dateFormatter.date(from: "09:53") ?? Date()
        let dateComponents = fromDate!.timeDifference(to: toTime)
        XCTAssertEqual(dateComponents.hour, 1)
        XCTAssertEqual(dateComponents.minute, 53)
    }
    
    func testMillisecondsToEpochReturnsExpectedValue() {
        let timeInterval: TimeInterval = 1_000_000
        let date = Date(timeIntervalSince1970: timeInterval)
        let milliseconds = date.millisecondsToEpoch
        XCTAssertEqual(milliseconds, Int64(timeInterval * 1000), "Milliseconds to epoch should be equal to time interval * 1000")
    }
    
    func testInitWithMillisecondsCreatesDateWithCorrectValue() {
        let milliseconds: Int64 = 1_000_000_000
        let date = Date(milliseconds: milliseconds)
        XCTAssertEqual(date.timeIntervalSince1970, Double(milliseconds) / 1000, "Date initialized with milliseconds should have time interval since 1970 equal to milliseconds / 1000")
    }
    
    private func checkEquality(timeToRound: String, expectedTime: String) {
        let date = dateFormatter.date(from: timeToRound)
        let expectedDate = dateFormatter.date(from: expectedTime)
        let roundedDate = date?.nearestQuarter
        XCTAssertEqual(expectedDate, roundedDate)
    }
    
}

// MARK: - 7 Day Range Check
extension DateExtensionTests {
    func testItChecksWhetherDatesAreWithinSevenDaysCorrectly() {
        let calendar = Calendar.current
        var dateComponents = DateComponents(day: 7)
        XCTAssertTrue(calendar.date(byAdding: dateComponents, to: Date())!.isDateInNext7Days())
        dateComponents.second = 1
        XCTAssertFalse(calendar.date(byAdding: dateComponents, to: Date())!.isDateInNext7Days())
    }
}
