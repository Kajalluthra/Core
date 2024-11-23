import XCTest
@testable import Core

class BirthdateValidatorTests: XCTestCase {
    func testItValidatesAValidBirthdate() {
        let validator = BirthdateValidator()
        switch validator.validate(value: "01/01/1950") {
        case .success:
            break
        case .failure:
            XCTFail()
        }
    }
    
    func testItDoesNotValidateABirthdateInTheFuture() {
        let validator = BirthdateValidator()
        switch validator.validate(value: "01/01/3000") {
        case .failure:
            break
        case .success:
            XCTFail()
        }
    }
    
    func testItDoesNotValidateABirthdateWithAnIncorrectFormat() {
        let validator = BirthdateValidator()
        switch validator.validate(value: "Hello") {
        case .failure:
            break
        case .success:
            XCTFail()
        }
    }
}
