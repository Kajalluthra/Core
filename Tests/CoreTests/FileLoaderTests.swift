import XCTest
@testable import Core

class FileLoaderTests: XCTestCase {
    
    func testLoadJSON_ValidFile() {
        let data = try? FileLoader.shared.loadJSON(filename: "ValidFile", bundle: Bundle.module)
        XCTAssertNotNil(data)
    }
    
    func testLoadJSON_InvalidFile() {
        XCTAssertThrowsError(try FileLoader.shared.loadJSON(filename: "invalidFile", bundle: Bundle.module))
    }
    
    func testLoadJSON_EmptyFile() {
        let data = try? FileLoader.shared.loadJSON(filename: "EmptyFile", bundle: Bundle.module)
        XCTAssertEqual(data?.count, 0)
    }
}
