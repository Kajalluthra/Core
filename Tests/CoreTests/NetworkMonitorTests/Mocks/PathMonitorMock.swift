import Foundation
import Network
@testable import Core

class PathMonitorMock: PathMonitor {
    var pathUpdateHandler: ((Path) -> Void)?
    func start(queue: DispatchQueue) {}
}
