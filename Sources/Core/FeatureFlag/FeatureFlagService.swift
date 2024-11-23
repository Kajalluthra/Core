import Foundation

public class FeatureFlagService: ObservableObject {

    private let featureFlagProvider: FeatureFlagProviderProtocol
    private let WRAPPED_WEB_KEY: String = "wrapped-web"
    private let CROSS_BORDER_KEY: String = "cross-border"
    private let SEAT_MAP_KEY: String = "seat-map"

    public var showWrappedWeb: Bool {
        return featureFlagProvider.getValue(for: WRAPPED_WEB_KEY)
    }

    public var includeCrossborder: Bool {
        return featureFlagProvider.getValue(for: CROSS_BORDER_KEY)
    }
    
    public var showSeatMap: Bool {
        return featureFlagProvider.getValue(for: SEAT_MAP_KEY)
    }
    
    public init(featureFlagProvider: FeatureFlagProviderProtocol = LaunchDarklyProvider()) {
        self.featureFlagProvider = featureFlagProvider
    }

}
