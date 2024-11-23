import Foundation

public extension Bool {
    var asDouble: Double {
        return self ? 1.0 : 0.0
    }
    
    var asInt: Int {
        return self ? 1 : 0
    }
}
