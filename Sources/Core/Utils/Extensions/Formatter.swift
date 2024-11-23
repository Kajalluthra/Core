import Foundation
import os

private let priceFractionDigits = 2

public extension Formatter {

    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        formatter.minimumFractionDigits = priceFractionDigits
        formatter.maximumFractionDigits = priceFractionDigits

        return formatter
    }()
}
