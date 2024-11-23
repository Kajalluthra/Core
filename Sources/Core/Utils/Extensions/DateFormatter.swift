import Foundation

public extension DateFormatter {

    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }

    static func getIso8601Formatter() -> DateFormatter {
        return getDateFormatter(with: "yyyy-MM-dd'T'HH:mm:ss")
    }

    static func getShortDateFormatter() -> DateFormatter {
        return getDateFormatter(with: "yyyy-MM-dd")
    }

    static func getSlashedMonthAndYearFormatter() -> DateFormatter {
        return getDateFormatter(with: "MM/yy")
    }

    static func getSlashedShortDateFormatter() -> DateFormatter {
        return getDateFormatter(with: "dd/MM/yyyy")
    }

    static func getSlashedDateFormatter() -> DateFormatter {
        return getDateFormatter(with: "dd/MM/yyyy HH:mm")
    }

    static func getHourAndMinutesFormatter() -> DateFormatter {
        return getDateFormatter(with: "HH:mm")
    }

    static func getDayAndMonthFormatter(addComma: Bool = false) -> DateFormatter {
        let format = addComma ? "EEE, dd MMM yyyy" : "EEE dd MMM"
        return getDateFormatter(with: format)
    }

    static func getDayMonthAndHourFormatter() -> DateFormatter {
        return getDateFormatter(with: "EEE, dd MMM yyyy, HH:mm")
    }

    static func getHoursFormatter() -> DateFormatter {
        return getDateFormatter(with: "HH")
    }

    static func getMinutesFormatter() -> DateFormatter {
        return getDateFormatter(with: "mm")
    }

    static func getSimpleHoursFormatter() -> DateFormatter {
        return getDateFormatter(with: "H")
    }

    static func getSimpleMinutesFormatter() -> DateFormatter {
        return getDateFormatter(with: "m")
    }

    private static func getDateFormatter(with dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = .current
        return dateFormatter
    }
}
