import Network

public class PathMonitorWrapper: PathMonitor {
    private let monitor = NWPathMonitor()
    
    public var pathUpdateHandler: ((Path) -> Void)? {
        didSet {
            monitor.pathUpdateHandler = { [weak self] path in
                self?.pathUpdateHandler?(path)
            }
        }
    }
    
    public init() {}
    
    public func start(queue: DispatchQueue) {
        monitor.start(queue: queue)
    }
}
