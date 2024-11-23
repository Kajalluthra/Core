import XCTest
@testable import Core

class DateFormatterTests: XCTestCase {
    
    func testIso8601Formatter() {
        let formatter = DateFormatter.getIso8601Formatter()
        XCTAssertEqual(formatter.dateFormat, "yyyy-MM-dd'T'HH:mm:ss")
    }

    func testShortDateFormatter() {
        let formatter = DateFormatter.getShortDateFormatter()
        XCTAssertEqual(formatter.dateFormat, "yyyy-MM-dd")
    }

    func testSlashedMonthAndYearFormatter() {
        let formatter = DateFormatter.getSlashedMonthAndYearFormatter()
        XCTAssertEqual(formatter.dateFormat, "MM/yy")
    }

    func testSlashedShortDateFormatter() {
        let formatter = DateFormatter.getSlashedShortDateFormatter()
        XCTAssertEqual(formatter.dateFormat, "dd/MM/yyyy")
    }

    func testSlashedDateFormatter() {
        let formatter = DateFormatter.getSlashedDateFormatter()
        XCTAssertEqual(formatter.dateFormat, "dd/MM/yyyy HH:mm")
    }

    func testHourAndMinutesFormatter() {
        let formatter = DateFormatter.getHourAndMinutesFormatter()
        XCTAssertEqual(formatter.dateFormat, "HH:mm")
    }

    func testDayAndMonthFormatter() {
        let formatter = DateFormatter.getDayAndMonthFormatter()
        XCTAssertEqual(formatter.dateFormat, "EEE dd MMM")
    }

    func testDayAndMonthFormatterWithComma() {
        let formatter = DateFormatter.getDayAndMonthFormatter(addComma: true)
        XCTAssertEqual(formatter.dateFormat, "EEE, dd MMM yyyy")
    }

    func testDayMonthAndHourFormatter() {
        let formatter = DateFormatter.getDayMonthAndHourFormatter()
        XCTAssertEqual(formatter.dateFormat, "EEE, dd MMM yyyy, HH:mm")
    }

    func testHoursFormatter() {
        let formatter = DateFormatter.getHoursFormatter()
        XCTAssertEqual(formatter.dateFormat, "HH")
    }

    func testMinutesFormatter() {
        let formatter = DateFormatter.getMinutesFormatter()
        XCTAssertEqual(formatter.dateFormat, "mm")
    }

    func testSimpleHoursFormatter() {
        let formatter = DateFormatter.getSimpleHoursFormatter()
        XCTAssertEqual(formatter.dateFormat, "H")
    }

    func testSimpleMinutesFormatter() {
        let formatter = DateFormatter.getSimpleMinutesFormatter()
        XCTAssertEqual(formatter.dateFormat, "m")
    }
}
