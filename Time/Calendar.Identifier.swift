
import Foundation

extension Calendar.Identifier: CaseIterable {

    public static var allCases: [Calendar.Identifier] {
        [
            .gregorian,
            .buddhist,
            .chinese,
            .coptic,
            .ethiopicAmeteMihret,
            .ethiopicAmeteAlem,
            .hebrew,
            .iso8601,
            .indian,
            .islamic,
            .islamicCivil,
            .japanese,
            .persian,
            .republicOfChina,
            .islamicTabular,
            .islamicUmmAlQura
        ]
    }
}

extension Calendar.Identifier: Comparable {

    public static func < (lhs: Calendar.Identifier, rhs: Calendar.Identifier) -> Bool {
        lhs.description < rhs.description
    }
}

extension Calendar.Identifier: CustomStringConvertible {

    public var description: String {
        switch self {
        case .gregorian: return "Gregorian"
        case .buddhist: return "Buddhist"
        case .chinese: return "Chinese"
        case .coptic: return "Coptic"
        case .ethiopicAmeteMihret: return "Ethiopic Amete Mihret"
        case .ethiopicAmeteAlem: return "Ethiopic Amete Alem"
        case .hebrew: return "Hebrew"
        case .iso8601: return "ISO8601"
        case .indian: return "Indian"
        case .islamic: return "Islamic"
        case .islamicCivil: return "Islamic Civil"
        case .japanese: return "Japanese"
        case .persian: return "Persian"
        case .republicOfChina: return "Republic of China"
        case .islamicTabular: return "Islamic Tabular"
        case .islamicUmmAlQura: return "Islamic Umm Al Qura"
        @unknown default: return "Unknown"
        }
    }
}

extension Calendar.Identifier: Identifiable {

    public var id: Calendar.Identifier { self }
}
