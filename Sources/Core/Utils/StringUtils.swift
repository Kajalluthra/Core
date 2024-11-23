import Foundation

public struct StringUtils {

    public static func anyStringsAreEmpty(strings: [String]) -> Bool {
        let emptyStrings = strings.filter({ $0.isEmpty })
        return emptyStrings.count > 0
    }

}
