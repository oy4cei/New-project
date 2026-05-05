import Foundation
import SwiftUI

enum AppLanguage: String, CaseIterable, Codable, Identifiable {
    case uk
    case en
    case ru

    var id: String { rawValue }

    var nativeName: String {
        switch self {
        case .uk: "Українська"
        case .en: "English"
        case .ru: "Русский"
        }
    }
}

struct LocalizedCopy: Codable, Hashable {
    let ru: String
    let uk: String
    let en: String

    func text(_ language: AppLanguage) -> String {
        switch language {
        case .uk: uk
        case .en: en
        case .ru: ru
        }
    }
}

enum DevelopmentDomain: String, CaseIterable, Codable, Identifiable {
    case motor
    case fineMotor
    case communication
    case social
    case cognition
    case feeding
    case screening

    var id: String { rawValue }

    func title(_ language: AppLanguage) -> String {
        switch (self, language) {
        case (.motor, .uk): "Рух"
        case (.motor, .en): "Movement"
        case (.motor, .ru): "Движение"
        case (.fineMotor, .uk): "Дрібна моторика"
        case (.fineMotor, .en): "Fine Motor"
        case (.fineMotor, .ru): "Мелкая моторика"
        case (.communication, .uk): "Мовлення"
        case (.communication, .en): "Speech"
        case (.communication, .ru): "Речь"
        case (.social, .uk): "Контакт"
        case (.social, .en): "Connection"
        case (.social, .ru): "Контакт"
        case (.cognition, .uk): "Пізнання"
        case (.cognition, .en): "Learning"
        case (.cognition, .ru): "Познание"
        case (.feeding, .uk): "Харчування"
        case (.feeding, .en): "Feeding"
        case (.feeding, .ru): "Питание"
        case (.screening, .uk): "Візити"
        case (.screening, .en): "Visits"
        case (.screening, .ru): "Визиты"
        }
    }

    var symbolName: String {
        switch self {
        case .motor: "figure.walk.motion"
        case .fineMotor: "hand.draw"
        case .communication: "bubble.left.and.bubble.right"
        case .social: "face.smiling"
        case .cognition: "lightbulb"
        case .feeding: "fork.knife"
        case .screening: "stethoscope"
        }
    }

    var tint: Color {
        switch self {
        case .motor: Color(red: 0.35, green: 0.65, blue: 0.82)      // soft sky blue
        case .fineMotor: Color(red: 0.60, green: 0.52, blue: 0.80)  // lavender
        case .communication: Color(red: 0.76, green: 0.48, blue: 0.72) // soft orchid
        case .social: Color(red: 0.90, green: 0.55, blue: 0.55)     // warm coral
        case .cognition: Color(red: 0.85, green: 0.70, blue: 0.35)  // warm amber
        case .feeding: Color(red: 0.45, green: 0.75, blue: 0.60)    // mint green
        case .screening: Color(red: 0.50, green: 0.60, blue: 0.85)  // periwinkle
        }
    }
}

enum EvidenceStrength: String, Codable {
    case cdc75
    case whoWindow
    case whoGuideline
    case aapScreening
    case practical

    func title(_ language: AppLanguage) -> String {
        switch (self, language) {
        case (.cdc75, .uk): "CDC: у 75% дітей до цього віку"
        case (.cdc75, .en): "CDC: 75% of children by this age"
        case (.cdc75, .ru): "CDC: у 75% детей к этому возрасту"
        case (.whoWindow, .uk): "WHO: вікно моторного розвитку"
        case (.whoWindow, .en): "WHO: motor development window"
        case (.whoWindow, .ru): "WHO: окно моторного развития"
        case (.whoGuideline, .uk): "WHO: клінічна рекомендація"
        case (.whoGuideline, .en): "WHO: clinical guideline"
        case (.whoGuideline, .ru): "WHO: клиническая рекомендация"
        case (.aapScreening, .uk): "AAP: скринінг розвитку"
        case (.aapScreening, .en): "AAP: developmental screening"
        case (.aapScreening, .ru): "AAP: скрининг развития"
        case (.practical, .uk): "Практичний орієнтир"
        case (.practical, .en): "Practical marker"
        case (.practical, .ru): "Практический ориентир"
        }
    }
}

enum MilestoneStatus: String, CaseIterable, Identifiable {
    case completed
    case discuss
    case monitor
    case current
    case upcoming

    var id: String { rawValue }

    func title(_ language: AppLanguage) -> String {
        switch (self, language) {
        case (.completed, .uk): "Позначено"
        case (.completed, .en): "Done"
        case (.completed, .ru): "Отмечено"
        case (.discuss, .uk): "Обговорити"
        case (.discuss, .en): "Discuss"
        case (.discuss, .ru): "Обсудить"
        case (.monitor, .uk): "Спостерігати"
        case (.monitor, .en): "Monitor"
        case (.monitor, .ru): "Наблюдать"
        case (.current, .uk): "Актуально"
        case (.current, .en): "Current"
        case (.current, .ru): "Актуально"
        case (.upcoming, .uk): "Незабаром"
        case (.upcoming, .en): "Upcoming"
        case (.upcoming, .ru): "Скоро"
        }
    }

    var symbolName: String {
        switch self {
        case .completed: "checkmark.circle.fill"
        case .discuss: "exclamationmark.triangle.fill"
        case .monitor: "eye.fill"
        case .current: "clock.fill"
        case .upcoming: "calendar"
        }
    }

    var tint: Color {
        switch self {
        case .completed: Color(red: 0.40, green: 0.78, blue: 0.56)  // soft green
        case .discuss: Color(red: 0.90, green: 0.50, blue: 0.42)    // soft terracotta
        case .monitor: Color(red: 0.50, green: 0.70, blue: 0.92)    // baby blue
        case .current: Color(red: 0.55, green: 0.60, blue: 0.85)    // soft indigo
        case .upcoming: Color(red: 0.70, green: 0.70, blue: 0.75)   // warm gray
        }
    }
}

struct BabyProfile: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var birthDate: Date
    var gestationalAgeWeeks: Int
    var useCorrectedAge: Bool

    static let sample = BabyProfile(
        id: UUID(),
        name: "",
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
    let title: LocalizedCopy
    let domain: DevelopmentDomain
    let dueMonth: Double
    let expectedWindow: ClosedRange<Double>?
    let typicalRange: ClosedRange<Double>?
    let evidence: EvidenceStrength
    let sources: [String]
    let clinicalNote: LocalizedCopy
    let actionNote: LocalizedCopy
    let percentileNote: LocalizedCopy?
    let isFlexibleVariant: Bool
    let cdcVideoURL: String?

    init(
        id: String, title: LocalizedCopy, domain: DevelopmentDomain,
        dueMonth: Double, expectedWindow: ClosedRange<Double>? = nil,
        typicalRange: ClosedRange<Double>? = nil,
        evidence: EvidenceStrength, sources: [String],
        clinicalNote: LocalizedCopy, actionNote: LocalizedCopy,
        percentileNote: LocalizedCopy? = nil,
        isFlexibleVariant: Bool, cdcVideoURL: String? = nil
    ) {
        self.id = id; self.title = title; self.domain = domain
        self.dueMonth = dueMonth; self.expectedWindow = expectedWindow
        self.typicalRange = typicalRange; self.evidence = evidence
        self.sources = sources; self.clinicalNote = clinicalNote
        self.actionNote = actionNote; self.percentileNote = percentileNote
        self.isFlexibleVariant = isFlexibleVariant; self.cdcVideoURL = cdcVideoURL
    }
}

struct MilestoneRecord: Codable, Equatable {
    var completedOn: Date?
    var observedDate: Date?
    var note: String
    var wasUnchecked: Bool
}

struct SourceReference: Identifiable, Hashable {
    let id: String
    let title: LocalizedCopy
    let organization: LocalizedCopy
    let url: String
    let note: LocalizedCopy
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

    static func ageText(months: Double, language: AppLanguage) -> String {
        let roundedMonths = max(0, Int(months.rounded(.down)))
        if roundedMonths < 1 {
            switch language {
            case .uk: return "менше 1 місяця"
            case .en: return "less than 1 month"
            case .ru: return "меньше 1 месяца"
            }
        }
        if roundedMonths < 12 {
            return "\(roundedMonths) \(monthWord(roundedMonths, language: language))"
        }
        let years = roundedMonths / 12
        let monthsLeft = roundedMonths % 12
        if monthsLeft == 0 {
            return "\(years) \(yearWord(years, language: language))"
        }
        return "\(years) \(yearWord(years, language: language)) \(monthsLeft) \(monthWord(monthsLeft, language: language))"
    }

    static func dueText(month: Double, language: AppLanguage) -> String {
        if month == 12 {
            switch language {
            case .uk: return "1 рік"
            case .en: return "1 year"
            case .ru: return "1 год"
            }
        }
        if month == 24 {
            switch language {
            case .uk: return "2 роки"
            case .en: return "2 years"
            case .ru: return "2 года"
            }
        }
        if month == 36 {
            switch language {
            case .uk: return "3 роки"
            case .en: return "3 years"
            case .ru: return "3 года"
            }
        }
        if month == 48 {
            switch language {
            case .uk: return "4 роки"
            case .en: return "4 years"
            case .ru: return "4 года"
            }
        }
        if month == 60 {
            switch language {
            case .uk: return "5 років"
            case .en: return "5 years"
            case .ru: return "5 лет"
            }
        }
        let clean = month.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(month))" : String(format: "%.1f", month)
        switch language {
        case .uk: return "\(clean) міс."
        case .en: return "\(clean) mo"
        case .ru: return "\(clean) мес."
        }
    }

    private static func monthWord(_ value: Int, language: AppLanguage) -> String {
        if language == .en {
            return value == 1 ? "month" : "months"
        }
        let mod10 = value % 10
        let mod100 = value % 100
        switch language {
        case .uk:
            if mod10 == 1 && mod100 != 11 { return "місяць" }
            if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "місяці" }
            return "місяців"
        case .en:
            return value == 1 ? "month" : "months"
        case .ru:
            if mod10 == 1 && mod100 != 11 { return "месяц" }
            if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "месяца" }
            return "месяцев"
        }
    }

    private static func yearWord(_ value: Int, language: AppLanguage) -> String {
        if language == .en {
            return value == 1 ? "year" : "years"
        }
        let mod10 = value % 10
        let mod100 = value % 100
        switch language {
        case .uk:
            if mod10 == 1 && mod100 != 11 { return "рік" }
            if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "роки" }
            return "років"
        case .en:
            return value == 1 ? "year" : "years"
        case .ru:
            if mod10 == 1 && mod100 != 11 { return "год" }
            if (2...4).contains(mod10) && !(12...14).contains(mod100) { return "года" }
            return "лет"
        }
    }
}
