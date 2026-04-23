import Foundation
import SwiftUI

enum DevelopmentDomain: String, CaseIterable, Codable, Identifiable {
    case motor
    case communication
    case social
    case cognition
    case feeding
    case screening

    var id: String { rawValue }

    var title: String {
        switch self {
        case .motor: "Движение"
        case .communication: "Речь"
        case .social: "Контакт"
        case .cognition: "Познание"
        case .feeding: "Питание"
        case .screening: "Визиты"
        }
    }

    var symbolName: String {
        switch self {
        case .motor: "figure.walk.motion"
        case .communication: "bubble.left.and.bubble.right"
        case .social: "face.smiling"
        case .cognition: "lightbulb"
        case .feeding: "fork.knife"
        case .screening: "stethoscope"
        }
    }

    var tint: Color {
        switch self {
        case .motor: Color(red: 0.12, green: 0.42, blue: 0.55)
        case .communication: Color(red: 0.54, green: 0.30, blue: 0.66)
        case .social: Color(red: 0.67, green: 0.24, blue: 0.32)
        case .cognition: Color(red: 0.48, green: 0.45, blue: 0.18)
        case .feeding: Color(red: 0.12, green: 0.47, blue: 0.33)
        case .screening: Color(red: 0.26, green: 0.34, blue: 0.61)
        }
    }
}

enum EvidenceStrength: String, Codable {
    case cdc75
    case whoWindow
    case whoGuideline
    case aapScreening
    case practical

    var title: String {
        switch self {
        case .cdc75: "CDC: у 75% детей к этому возрасту"
        case .whoWindow: "WHO: окно моторного развития"
        case .whoGuideline: "WHO: клиническая рекомендация"
        case .aapScreening: "AAP: скрининг развития"
        case .practical: "Практический ориентир"
        }
    }
}

enum MilestoneStatus: String, CaseIterable, Identifiable {
    case completed
    case discuss
    case current
    case upcoming

    var id: String { rawValue }

    var title: String {
        switch self {
        case .completed: "Отмечено"
        case .discuss: "Обсудить"
        case .current: "Актуально"
        case .upcoming: "Скоро"
        }
    }

    var symbolName: String {
        switch self {
        case .completed: "checkmark.circle.fill"
        case .discuss: "exclamationmark.triangle.fill"
        case .current: "clock.fill"
        case .upcoming: "calendar"
        }
    }

    var tint: Color {
        switch self {
        case .completed: Color(red: 0.05, green: 0.48, blue: 0.31)
        case .discuss: Color(red: 0.77, green: 0.29, blue: 0.22)
        case .current: Color(red: 0.14, green: 0.39, blue: 0.64)
        case .upcoming: Color.secondary
        }
    }
}

struct BabyProfile: Codable, Equatable {
    var name: String
    var birthDate: Date
    var gestationalAgeWeeks: Int
    var useCorrectedAge: Bool

    static let sample = BabyProfile(
        name: "Малыш",
        birthDate: Calendar.current.date(byAdding: .month, value: -7, to: Date()) ?? Date(),
        gestationalAgeWeeks: 40,
        useCorrectedAge: true
    )

    var wasPreterm: Bool {
        gestationalAgeWeeks < 37
    }
}

struct Milestone: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let domain: DevelopmentDomain
    let dueMonth: Double
    let expectedWindow: ClosedRange<Double>?
    let evidence: EvidenceStrength
    let sources: [String]
    let clinicalNote: String
    let actionNote: String
    let isFlexibleVariant: Bool
}

struct MilestoneRecord: Codable, Equatable {
    var completedOn: Date?
    var note: String
}

struct SourceReference: Identifiable, Hashable {
    let id: String
    let title: String
    let organization: String
    let url: String
    let note: String
}

enum AgeFormatter {
    static func monthsBetween(_ start: Date, and end: Date, calendar: Calendar = .current) -> Double {
        let days = max(0, calendar.dateComponents([.day], from: start, to: end).day ?? 0)
        return Double(days) / 30.4375
    }

    static func correctedAgeMonths(for profile: BabyProfile, on date: Date = Date(), calendar: Calendar = .current) -> Double {
        let chronological = monthsBetween(profile.birthDate, and: date, calendar: calendar)
        guard profile.useCorrectedAge, profile.wasPreterm, chronological < 24 else {
            return chronological
        }
        let weeksEarly = max(0, 40 - profile.gestationalAgeWeeks)
        let corrected = chronological - (Double(weeksEarly) / 4.34524)
        return max(0, corrected)
    }

    static func ageText(months: Double) -> String {
        let roundedMonths = max(0, Int(months.rounded(.down)))
        if roundedMonths < 1 {
            return "меньше 1 месяца"
        }
        if roundedMonths < 12 {
            return "\(roundedMonths) \(monthWord(roundedMonths))"
        }
        let years = roundedMonths / 12
        let monthsLeft = roundedMonths % 12
        if monthsLeft == 0 {
            return "\(years) \(yearWord(years))"
        }
        return "\(years) \(yearWord(years)) \(monthsLeft) \(monthWord(monthsLeft))"
    }

    static func dueText(month: Double) -> String {
        if month == 12 {
            return "1 год"
        }
        if month == 24 {
            return "2 года"
        }
        let clean = month.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(month))" : String(format: "%.1f", month)
        return "\(clean) мес."
    }

    private static func monthWord(_ value: Int) -> String {
        let mod10 = value % 10
        let mod100 = value % 100
        if mod10 == 1 && mod100 != 11 { return "месяц" }
        if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "месяца" }
        return "месяцев"
    }

    private static func yearWord(_ value: Int) -> String {
        let mod10 = value % 10
        let mod100 = value % 100
        if mod10 == 1 && mod100 != 11 { return "год" }
        if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "года" }
        return "лет"
    }
}
