import Foundation
import AnyFormatKit

extension String {
    var localized: String {
        NSLocalizedString(self, bundle: Bundle.module, comment: " ")
    }
}

public extension StringProtocol {
    func htmlToAttributedString() throws -> AttributedString {
        try AttributedString(
            NSAttributedString(
                data: Data(utf8),
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: NSUTF8StringEncoding
                ],
                documentAttributes: nil
            )
        )
    }
}

public extension String {
    func format(_ format: String, oldString: String) -> String {
        let formatter = DefaultTextFormatter(textPattern: format)
        let stringUnformatted = formatter.unformat(self)
        return formatter.format(stringUnformatted) ?? oldString
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    func extractUrl() -> String {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        let urls = matches?.compactMap { match -> String? in
            guard let range = Range(match.range, in: self) else { return nil }
            let url = self[range]
            return String(url)
        }

        return urls?.first ?? ""
    }

    func deletingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
}
