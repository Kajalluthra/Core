import Foundation

public enum TripDirection: String {
    case outboundDirection
    case returnDirection

    public func getText() -> String {
        switch self {
        case .outboundDirection:
            return "summary.outbound.title".localized
        case .returnDirection:
            return "summary.return.title".localized
        }
    }
}
