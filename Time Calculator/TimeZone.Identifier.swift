
import Foundation

extension TimeZone {

    public struct Identifier: Hashable {
        fileprivate let value: String
        fileprivate init(value: String) {
            self.value = value
        }
    }

    public init(identifier: Identifier) {
        self.init(identifier: identifier.value)!
    }
}

extension TimeZone: Identifiable {

    public var id: TimeZone.Identifier { Identifier(value: identifier) }
}

extension TimeZone.Identifier: CaseIterable {

    public static var allCases: [TimeZone.Identifier] {
        TimeZone.knownTimeZoneIdentifiers.map(TimeZone.Identifier.init)
    }
}

extension TimeZone.Identifier: Comparable {

    public static func < (lhs: TimeZone.Identifier, rhs: TimeZone.Identifier) -> Bool {
        lhs.value < rhs.value
    }
}

extension TimeZone.Identifier: CustomStringConvertible {

    public var description: String { value }
}

extension TimeZone.Identifier: Identifiable {

    public var id: TimeZone.Identifier { self }
}
