import SwiftUI

public extension Binding where Value == Bool {
    var negate: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }}

extension Binding where Value == Bool {
    public static func && (_ lhs: Binding<Bool>, _ rhs: Binding<Bool>) -> Binding<Bool> {
        return Binding<Bool>( get: { lhs.wrappedValue && rhs.wrappedValue },
                              set: {_ in })
    }
}
