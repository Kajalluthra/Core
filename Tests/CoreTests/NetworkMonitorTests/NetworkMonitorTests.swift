import XCTest
import Network
@testable import Core

class NetworkMonitorTests: XCTestCase {
    var networkMonitor: NetworkMonitor!
    var monitorMock: PathMonitorMock!

    override func setUp() {
        super.setUp()
        monitorMock = PathMonitorMock()
        networkMonitor = NetworkMonitor(monitor: monitorMock)
    }

    override func tearDown() {
        networkMonitor = nil
        monitorMock = nil
        super.tearDown()
    }

    func testIsConnectedWhenPathStatusIsSatisfied() {
        let path = PathMock(status: .satisfied)
        let expectation = XCTestExpectation(description: "Network status updated")
        monitorMock.pathUpdateHandler?(path)
        DispatchQueue.main.async {
            if self.networkMonitor.isConnected {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testIsNotConnectedWhenPathStatusIsUnsatisfied() {
        let path = PathMock(status: .unsatisfied)
        let expectation = XCTestExpectation(description: "Network status updated")
        monitorMock.pathUpdateHandler?(path)
        DispatchQueue.main.async {
            if !self.networkMonitor.isConnected {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
