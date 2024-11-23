import XCTest
@testable import Core

class NameValidatorTests: XCTestCase {

    func testIsValidName() {
        let validator = NameValidator()
        let name = "John"
        let result = validator.validate(value: name)
        switch result {
        case .success:
            XCTAssert(true)
        case .failure:
            XCTFail("Name validation failed for valid name: \(name)")
        }
    }

    func testIsInvalidName() {
        let validator = NameValidator()
        let name = "John123"
        let result = validator.validate(value: name)
        switch result {
        case .success:
            XCTFail("Name validation succeeded for invalid name, it can't have numbers: \(name)")
        case .failure:
            XCTAssert(true)
        }
    }

}
