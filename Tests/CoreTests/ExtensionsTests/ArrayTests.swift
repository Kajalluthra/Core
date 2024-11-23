import XCTest
@testable import Core

class ArrayTests: XCTestCase {
    
    func testRemovingDuplicatesShouldReturnANewArrayWithUniqueValues() {
        let array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
        let uniqueArray = array.removingDuplicates()
        XCTAssertEqual(uniqueArray, [1, 2, 3, 4])
    }

    func testRemoveDuplicatesShouldConvertArrayObjectToAnArrayWithUniqueValues() {
        var array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
        array.removeDuplicates()
        XCTAssertEqual(array, [1, 2, 3, 4])
    }
    
}
