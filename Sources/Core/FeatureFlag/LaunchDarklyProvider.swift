import Foundation
import LaunchDarkly

public class LaunchDarklyProvider: FeatureFlagProviderProtocol {

    private let client: LDClient?

    public init() {
        let config = LDConfig(mobileKey: Config.launchDarklyMobileKey, autoEnvAttributes: .enabled)
        let contextBuilder = LDContextBuilder(key: Config.launchDarklyContext)
        let context = try? contextBuilder.build().get()
        LDClient.start(config: config, context: context, completion: nil)
        self.client = LDClient.get()
    }

    public func getValue(for key: String) -> Bool {
        guard let client = client else { return false }
        return client.boolVariation(forKey: key, defaultValue: false)
    }
}
