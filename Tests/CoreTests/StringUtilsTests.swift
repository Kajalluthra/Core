import XCTest
@testable import Core

class StringUtilsTests: XCTestCase {
    func testWhenAnyStringsAreEmptyIsCalledWithAllEmptyStringsItShouldReturnTrue() {
        let result = StringUtils.anyStringsAreEmpty(strings: ["", "", ""])
        XCTAssertTrue(result)
    }

    func testWhenAnyStringsAreEmptyIsCalledWithSomeEmptyStringsItShouldReturnTrue() {
        let result = StringUtils.anyStringsAreEmpty(strings: ["test", "", "test"])
        XCTAssertTrue(result)
    }

    func testWhenAnyStringsAreEmptyIsCalledWithNoneEmptyStringsItShouldReturnFalse() {
        let result = StringUtils.anyStringsAreEmpty(strings: ["test", "test", "test"])
        XCTAssertFalse(result)
    }

    func testWhenAnyStringsAreEmptyIsCalledWithEmptyArrayItShouldReturnFalse() {
        let result = StringUtils.anyStringsAreEmpty(strings: [])
        XCTAssertFalse(result)
    }
}
