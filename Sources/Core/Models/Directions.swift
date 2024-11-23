import Foundation
import os

public enum Directions: String, CaseIterable {
    case departing
    case arriving
    
    public var inverted: Self {
        return self == .departing ? .arriving : .departing
    }
    
    public func getText() -> String {
        switch self {
        case .departing:
            return "search.direction.component.departing.title".localized
        case .arriving:
            return "search.direction.component.arriving.title".localized
        }
    }
}
