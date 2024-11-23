import Foundation

public struct ValidationError: Error {
    
    let message: String

    public init(message: String) {
        self.message = message
    }
}

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}
