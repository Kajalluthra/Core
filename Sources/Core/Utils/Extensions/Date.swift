import Foundation

extension Date {
    public var nearestQuarter: Date {
        let numberOfMinutes = 15
        let secondsPerMinute = 60
        let totalSeconds: Double = Double(numberOfMinutes * secondsPerMinute)
        return Date(timeIntervalSinceReferenceDate: (self.timeIntervalSinceReferenceDate / totalSeconds).rounded(.up) * totalSeconds)
    }

    public var millisecondsToEpoch: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    public init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    public func timeDifference(to time: Date) -> DateComponents {
        let dateFormatter = DateFormatter.getHourAndMinutesFormatter()
        let nowDateString = dateFormatter.string(from: self)
        let nowDate = dateFormatter.date(from: nowDateString) ?? Date()
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: nowDate, to: time)
        return dateComponents
    }

    public func isDateInNext7Days() -> Bool {
        let dateInSevenDays = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
        return self < dateInSevenDays && self.timeIntervalSinceNow > 0
    }
}
