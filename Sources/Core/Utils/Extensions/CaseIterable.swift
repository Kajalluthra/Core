import Foundation
import os

public extension CaseIterable where Self: Equatable {

    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
}
