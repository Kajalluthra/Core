import Foundation

public enum TrainStatus: String, Codable {
    case onTime = "on time"
    case delayed = "delayed"
    case canceled = "canceled"
    case cancelled = "cancelled"
    case departed = "departed"
    case arrived = "arrived"

    public func getStatusText() -> String {
        switch self {
        case .onTime:
            return "on.time.text".localized
        case .delayed:
            return "delayed.text".localized
        case .canceled, .cancelled:
            return "cancelled.text".localized
        case .departed:
            return "departed.text".localized
        case .arrived:
            return "arrived.text".localized
        }
    }

}
