import XCTest
@testable import Core

class EmailValidatorTests: XCTestCase {

    func testIsValidEmail() {
        let validator = EmailValidator()
        let email = "example@example.com"
        let result = validator.validate(value: email)
        switch result {
        case .success:
            XCTAssert(true)
        case .failure:
            XCTFail("Email validation failed for valid email: \(email)")
        }
    }

    func testIsInvalidEmail() {
        let validator = EmailValidator()
        let email = "example@example"
        let result = validator.validate(value: email)
        switch result {
        case .success:
            XCTFail("Email validation succeeded for invalid email: \(email)")
        case .failure:
            XCTAssert(true)
        }
    }

}
