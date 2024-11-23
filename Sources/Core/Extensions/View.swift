import SwiftUI

enum CoreConfigForPreview: CoreConfig {
    static var launchDarklyMobileKey: String { return "" }
    static var launchDarklyContext: String { return "" }
    static var analyticsManager: AnalyticsManager? { return nil }
}

extension View {
    public func setupCore() -> some View {
        Core.setup(with: CoreConfigForPreview.self)
        return self
    }
}

extension View {
    public func trackScreen(_ screenName: String) -> some View {
        self.modifier(ScreenViewModifier(screenName: screenName))
    }
}
