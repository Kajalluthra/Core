import XCTest
import SwiftUI
@testable import Core

class BindingTests: XCTestCase {
    
    func testNegateShouldChangeTheBindingValueToTheOpposite() {
        var value = true
        let binding = Binding<Bool>(get: { value }, set: { value = $0 })
        let negatedBinding = binding.negate
        XCTAssertEqual(negatedBinding.wrappedValue, !value)
    }

    func testAndOperatorWrappedValueShouldBeEqualToAndBetweenPlainValues() {
        var lhsValue = true
        var rhsValue = false
        let lhsBinding = Binding<Bool>(get: { lhsValue }, set: { lhsValue = $0 })
        let rhsBinding = Binding<Bool>(get: { rhsValue }, set: { rhsValue = $0 })
        let andBinding = lhsBinding && rhsBinding
        XCTAssertEqual(andBinding.wrappedValue, lhsValue && rhsValue)
    }
}
