import Foundation
@testable import Core

class FeatureFlagProviderMock: FeatureFlagProviderProtocol {
    private var values: [String: Bool] = [:]
    var getValueCalled = false
    
    func getValue(for key: String) -> Bool {
        getValueCalled = true
        return values[key] ?? false
    }
    
    func setValue(_ value: Bool, for key: String) {
        values[key] = value
    }
}
