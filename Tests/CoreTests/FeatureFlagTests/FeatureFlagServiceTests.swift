import XCTest
@testable import Core

class FeatureFlagServiceTests: XCTestCase {
    var featureFlagService: FeatureFlagService!
    var featureFlagProviderMock: FeatureFlagProviderMock!
    
    override func setUp() {
        super.setUp()
        featureFlagProviderMock = FeatureFlagProviderMock()
        featureFlagService = FeatureFlagService(featureFlagProvider: featureFlagProviderMock)
    }
    
    override func tearDown() {
        featureFlagService = nil
        featureFlagProviderMock = nil
        super.tearDown()
    }
    
    func testShowWrappedWebCallsGetValueInProvider() {
        _ = featureFlagService.showWrappedWeb
        XCTAssertTrue(featureFlagProviderMock.getValueCalled)
    }
    
    func testShowWrappedWebShouldBeTrueWhenFeatureFlagProviderReturnsTrueForTheProperty() {
        featureFlagProviderMock.setValue(true, for: "wrapped-web")
        XCTAssertTrue(featureFlagService.showWrappedWeb)
    }
    
    func testShowWrappedWebShouldBeFalseWhenFeatureFlagProviderReturnsFalseForTheProperty() {
        featureFlagProviderMock.setValue(false, for: "wrapped-web")
        XCTAssertFalse(featureFlagService.showWrappedWeb)
    }

    func testIncludeCrossborderCallsGetValueInProvider() {
        _ = featureFlagService.includeCrossborder
        XCTAssertTrue(featureFlagProviderMock.getValueCalled)
    }

    func testIncludeCrossborderShouldBeTrueWhenFeatureFlagProviderReturnsTrueForTheProperty() {
        featureFlagProviderMock.setValue(true, for: "cross-border")
        XCTAssertTrue(featureFlagService.includeCrossborder)
    }

    func testIncludeCrossborderShouldBeFalseWhenFeatureFlagProviderReturnsFalseForTheProperty() {
        featureFlagProviderMock.setValue(false, for: "cross-border")
        XCTAssertFalse(featureFlagService.includeCrossborder)
    }
    
    func testShowSeatMapCallsGetValueInProvider() {
        _ = featureFlagService.showSeatMap
        XCTAssertTrue(featureFlagProviderMock.getValueCalled)
    }
    
    func testShowSeatMapShouldBeTrueWhenFeatureFlagProviderReturnsTrueForTheProperty() {
        featureFlagProviderMock.setValue(true, for: "seat-map")
        XCTAssertTrue(featureFlagService.showSeatMap)
    }
    
    func testShowSeatMapShouldBeFalseWhenFeatureFlagProviderReturnsFalseForTheProperty() {
        featureFlagProviderMock.setValue(false, for: "seat-map")
        XCTAssertFalse(featureFlagService.showSeatMap)
    }
}
