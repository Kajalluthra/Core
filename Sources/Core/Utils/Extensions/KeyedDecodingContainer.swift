import Foundation

extension KeyedDecodingContainer {

    public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        return try self.decode(T.self, forKey: key)
    }

    public func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }

    public func decodeDate(_ key: Key, format: DateFormatter?) throws -> Date {
        if let dateFormatter = format {
            let stringDate: String = try decode(key)
            if let date = dateFormatter.date(from: stringDate) {
                return date
            } else {
                throw DecodingError.typeMismatch(String.self, DecodingError.Context(codingPath: [key], debugDescription: "Date string does not match format expected by formatter."))
            }
        } else {
            return try decode(key)
        }
    }

    public func decodeDateIfPresent(_ key: Key, format: DateFormatter?) throws -> Date? {
        if let dateFormatter = format {
            if let stringDate: String = try decodeIfPresent(key), let date = dateFormatter.date(from: stringDate) {
                return date
            } else {
                return nil
            }
        } else {
            return try decodeIfPresent(key)
        }
    }
}
