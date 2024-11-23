import XCTest
import Foundation
@testable import Core

class URLComponentsTests: XCTestCase {
    
    func testSetQueryItemsWithParametersShouldUpdateQueryItemsValuesInUrlComponents() {
        var urlComponents = URLComponents()
        urlComponents.setQueryItems(with: ["key1": "value1", "key2": "value2"])
        XCTAssertNotNil(urlComponents.queryItems?.contains(URLQueryItem(name: "key1", value: "value1")))
        XCTAssertNotNil(urlComponents.queryItems?.contains(URLQueryItem(name: "key2", value: "value2")))
    }

    func testSetQueryItemsWithArrayOfParametersShouldUpdateQueryItemsWithOnePerItemInArray() {
        var urlComponents = URLComponents()
        urlComponents.setQueryItems(with: ["key1": "value1"], arrayParameterName: "array", arrayParameters: ["value2", "value3"])
        XCTAssertNotNil(urlComponents.queryItems?.contains(URLQueryItem(name: "key1", value: "value1")))
        XCTAssertNotNil(urlComponents.queryItems?.contains(URLQueryItem(name: "array", value: "value2")))
        XCTAssertNotNil(urlComponents.queryItems?.contains(URLQueryItem(name: "array", value: "value3")))
    }
}
