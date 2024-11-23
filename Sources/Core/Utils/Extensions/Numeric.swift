import Foundation

public extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? ""}
}
