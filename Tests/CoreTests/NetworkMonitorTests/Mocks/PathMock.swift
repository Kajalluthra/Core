@testable import Core
import Network

class PathMock: Path {
    var status: NWPath.Status
    init(status: NWPath.Status) {
        self.status = status
    }
}
