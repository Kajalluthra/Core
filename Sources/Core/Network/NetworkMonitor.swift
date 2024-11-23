import Network
import SwiftUI

public protocol Path {
    var status: NWPath.Status { get }
}

extension NWPath: Path {}

public protocol PathMonitor {
    var pathUpdateHandler: ((Path) -> Void)? { get set }
    func start(queue: DispatchQueue)
}

public class NetworkMonitor: ObservableObject {
    private var monitor: PathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published public var isConnected = true

    public init(monitor: PathMonitor = PathMonitorWrapper()) {
        self.monitor = monitor
        self.monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
