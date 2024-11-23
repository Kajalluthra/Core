import XCTest
@testable import Core

class CurrencyUtilsTests: XCTestCase {
    
    func testGetPriceValue_whenPriceStringAndCurrencyProvided_returnsPriceOnlyString() {
        let priceString = "£52.3"
        let getPriceValueString = CurrencyUtils.getPriceValue(from: priceString, locale: Locale(identifier: "en_GB"))
        XCTAssertEqual(getPriceValueString, "52.3")
    }
    
    func testGetPriceValue_withWrongPriceWithCurrencyString_returnsZero() {
        let priceString = "GBPA52.3"
        let getPriceValueString = CurrencyUtils.getPriceValue(from: priceString)
        XCTAssertEqual(getPriceValueString, "0.0")
    }
    
    func testGetPriceWithCurrencyReturnsFormattedValueWithCurrencySymbolAndSeparator() {
        let price: Float = 1234.56
        let currency = "GBP"
        
        let result = CurrencyUtils.getPriceWithCurrency(price: price, currency: currency)
        
        XCTAssertEqual(result, "£1,234.56")
    }
    
    func testGetPriceWithCurrencyForUnknownCurrencyReturnsOnlyPrice() {
        let price: Float = 1234.56
        let currency = "XYZ"
        
        let result = CurrencyUtils.getPriceWithCurrency(price: price, currency: currency)
        
        XCTAssertEqual(result, "1,234.56")
    }
}
