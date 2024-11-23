import Foundation

public struct RailAppStringUtils {
    
    public static func buildPassengersString(numberOfAdults: Int, numberOfChildren: Int) -> String {
        let adultsFormatString = "passengers.selector.number.of.adults".localized
        let adultsPassengersString = String.localizedStringWithFormat(adultsFormatString, numberOfAdults)
        let childrenFormatString = "passengers.selector.number.of.children".localized
        let childrenPassengersString = String.localizedStringWithFormat(childrenFormatString, numberOfChildren)
        let unionString = !adultsPassengersString.isEmpty && !childrenPassengersString.isEmpty ? ", " : ""
        return adultsPassengersString + unionString + childrenPassengersString
    }

    public static func getChangesAndDurationText(numChanges: Int, duration: String) -> String {
        let durationText = getDurationText(duration: duration)
        let changesText = String.localizedStringWithFormat("shopping.legs.number.of.changes".localized, numChanges)
        return changesText + ", " + durationText
    }

    public static func getDurationText(duration: String) -> String {
        let date = DateFormatter.getHourAndMinutesFormatter().date(from: duration)
        let hourText = DateFormatter.getSimpleHoursFormatter().string(from: date ?? Date()) + "hr "
        let minutesText = DateFormatter.getSimpleMinutesFormatter().string(from: date ?? Date()) + "m"
        return (hourText != "0hr " ? hourText : "") + minutesText
    }

    public static func getDuration(fromDate: String, toDate: String) -> String {
        let fromDateFormatted = DateFormatter.getHourAndMinutesFormatter().date(from: fromDate)
        let toDateFormatted = DateFormatter.getHourAndMinutesFormatter().date(from: toDate) ?? Date()
        let dateComponents = fromDateFormatted?.timeDifference(to: toDateFormatted)
        return "\(dateComponents?.hour ?? 0):\(dateComponents?.minute ?? 0)"
    }
}
