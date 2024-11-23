import Foundation

public protocol CoreConfig {
    static var launchDarklyMobileKey: String { get }
    static var launchDarklyContext: String { get }
    static var analyticsManager: AnalyticsManager? { get }
}

public func setup(with config: CoreConfig.Type) {
    ConfigType.shared = ConfigType(config)
}

var Config: ConfigType { // swiftlint:disable:this variable_name
    if let config = ConfigType.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ConfigType.self))")
    }
}

final class ConfigType {
    static fileprivate var shared: ConfigType?
    
    let launchDarklyMobileKey: String
    let launchDarklyContext: String
    let analyticsManager: AnalyticsManager?
    
    fileprivate init(_ config: CoreConfig.Type) {
        self.launchDarklyMobileKey = config.launchDarklyMobileKey
        self.launchDarklyContext = config.launchDarklyContext
        self.analyticsManager = config.analyticsManager
    }
}
