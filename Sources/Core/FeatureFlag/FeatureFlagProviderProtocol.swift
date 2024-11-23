import Foundation

public protocol FeatureFlagProviderProtocol {
    func getValue(for key: String) -> Bool
}
