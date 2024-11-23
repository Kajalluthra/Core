import XCTest
@testable import Core

class PasswordValidatorsTests: XCTestCase {

    func testIsValidPassword() {
        let validator = PasswordValidator()
        let password = "Pa$sw0rd"
        let result = validator.validate(value: password)
        switch result {
        case .success:
            XCTAssert(true)
        case .failure:
            XCTFail("Password should have a capital letter, a special character and a minimum of 8 characters: \(password)")
        }
    }

    func testIsNotValidPasswordWhenNotHavingCapitalLetter() {
        let validator = PasswordValidator()
        let password = "pa$sw0rd"
        let result = validator.validate(value: password)
        switch result {
        case .success:
            XCTFail("Password validation succeeded for invalid password, it should have a capital letter: \(password)")
        case .failure:
            XCTAssert(true)
        }
    }

    func testIsNotValidPasswordWhenIsAllCapitalLetters() {
        let validator = PasswordValidator()
        let password = "PA$SWORD"
        let result = validator.validate(value: password)
        switch result {
        case .success:
            XCTFail("Password validation succeeded for invalid password, it should have a lowercase letter: \(password)")
        case .failure:
            XCTAssert(true)
        }
    }

    func testIsNotValidPasswordWhenIsLessThan8Characters() {
        let validator = PasswordValidator()
        let password = "Pa$swor"
        let result = validator.validate(value: password)
        switch result {
        case .success:
            XCTFail("Password validation succeeded for invalid password, it should have at least 8 characters: \(password)")
        case .failure:
            XCTAssert(true)
        }
    }

    func testIsNotValidPasswordWhenNotHavingSpecialCharacter() {
        let validator = PasswordValidator()
        let password = "Password"
        let result = validator.validate(value: password)
        switch result {
        case .success:
            XCTFail("Password validation succeeded for invalid password, it should have at least 1 special character: \(password)")
        case .failure:
            XCTAssert(true)
        }
    }

}
