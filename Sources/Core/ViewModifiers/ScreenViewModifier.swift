import SwiftUI

struct ScreenViewModifier: ViewModifier {
    let screenName: String
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                Config.analyticsManager?.trackScreen(screenName: screenName)
            }
    }
}
