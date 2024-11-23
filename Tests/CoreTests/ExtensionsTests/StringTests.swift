import XCTest
import Foundation
@testable import Core

class StringTests: XCTestCase {
    
    func testWhenCalledHtmlToAttributedStringWithHtmlReturnsExpectedAttributedString() throws {
        let htmlString = "<b>Hello, World!</b>"
        let attributedString: AttributedString = try htmlString.htmlToAttributedString()
        let expectedNSAttributedString = try NSAttributedString(
            data: Data("<b>Hello, World!</b>".utf8),
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: NSUTF8StringEncoding
            ],
            documentAttributes: nil
        )
        let expectedAttributedString = AttributedString(expectedNSAttributedString)
        XCTAssertEqual(attributedString, expectedAttributedString)
    }
    
    func testWhenFormatCalledWithCorrectFormatShouldReturnExpectedFormattedString() {
        let formatted = "1234567890".format("(###) ###-####", oldString: "")
        XCTAssertEqual(formatted, "(123) 456-7890")
    }
    
    func testWhenFormatCalledWithEmptyStringShouldReturnEmptyFormattedString() {
        let emptyFormatted = "".format("(###) ###-####", oldString: "")
        XCTAssertEqual(emptyFormatted, "")
    }
    
    func testWhenCapitalizingFirstLetterIsCalledThenCapitalizedStringShouldBeReturned() {
        let capitalized = "hello".capitalizingFirstLetter()
        XCTAssertEqual(capitalized, "Hello")
    }
    
    func testWhenExtractUrlIsCalledWithStringContainingUrlItShouldBeReturned() {
        let url = "Check out https://www.example.com for more info".extractUrl()
        XCTAssertEqual(url, "https://www.example.com")
    }
    
    func testWhenExtractUrlIsCalledWithStringNotContainingUrlItShouldReturnEmptyString() {
        let noUrl = "Check out for more info".extractUrl()
        XCTAssertEqual(noUrl, "")
    }
    
    func testWhenDeletingPrefixIsCalledWithPrefixContainedInStringItShouldReturnOriginalStringWithoutPrefix() {
        let withoutPrefix = "Hello, World!".deletingPrefix("Hello, ")
        XCTAssertEqual(withoutPrefix, "World!")
    }
    
    func testWhenDeletingPrefixIsCalledWithPrefixNotContainedInStringItShouldReturnOriginalString() {
        let noPrefix = "Hello, World!".deletingPrefix("Goodbye, ")
        XCTAssertEqual(noPrefix, "Hello, World!")
    }
}
