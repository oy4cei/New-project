import Foundation

final class DevelopmentStore: ObservableObject {
    @Published var profiles: [BabyProfile] {
        didSet { saveProfiles() }
    }

    @Published var activeProfileId: UUID {
        didSet { saveActiveProfileId() }
    }

    @Published var records: [String: [String: MilestoneRecord]] {
        didSet { saveRecords() }
    }

    @Published var language: AppLanguage {
        didSet { saveLanguage() }
    }

    private let profilesKey = "baby-profiles-v2"
    private let activeProfileKey = "active-profile-v2"
    private let recordsKey = "milestone-records-v2"
    private let languageKey = "app-language-v1"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    var profile: BabyProfile {
        get { profiles.first { $0.id == activeProfileId } ?? profiles[0] }
        set {
            if let idx = profiles.firstIndex(where: { $0.id == newValue.id }) {
                profiles[idx] = newValue
            }
        }
    }

    private var activeRecords: [String: MilestoneRecord] {
        get { records[activeProfileId.uuidString] ?? [:] }
        set { records[activeProfileId.uuidString] = newValue }
    }

    init(defaults: UserDefaults = .standard) {
        let dec = JSONDecoder()

        // 1. Load profiles
        let loadedProfiles: [BabyProfile]
        if let data = defaults.data(forKey: profilesKey),
           let stored = try? dec.decode([BabyProfile].self, from: data), !stored.isEmpty {
            loadedProfiles = stored
        } else if let data = defaults.data(forKey: "baby-profile-v1"),
                  let old = try? dec.decode(BabyProfileV1.self, from: data) {
            loadedProfiles = [BabyProfile(id: UUID(), name: old.name, birthDate: old.birthDate,
                                          gestationalAgeWeeks: old.gestationalAgeWeeks, useCorrectedAge: old.useCorrectedAge)]
        } else {
            loadedProfiles = [.sample]
        }

        // 2. Load active profile id
        let loadedActiveId: UUID
        if let idStr = defaults.string(forKey: activeProfileKey), let id = UUID(uuidString: idStr),
           loadedProfiles.contains(where: { $0.id == id }) {
            loadedActiveId = id
        } else {
            loadedActiveId = loadedProfiles[0].id
        }

        // 3. Load records
        let loadedRecords: [String: [String: MilestoneRecord]]
        if let data = defaults.data(forKey: recordsKey),
           let stored = try? dec.decode([String: [String: MilestoneRecord]].self, from: data) {
            loadedRecords = stored
        } else if let data = defaults.data(forKey: "milestone-records-v1"),
                  let old = try? dec.decode([String: MilestoneRecordV1].self, from: data) {
            let migrated = old.mapValues { MilestoneRecord(completedOn: $0.completedOn, observedDate: nil, note: $0.note, wasUnchecked: false) }
            loadedRecords = [loadedActiveId.uuidString: migrated]
        } else {
            loadedRecords = [:]
        }

        // 4. Load language
        let loadedLanguage: AppLanguage
        if let raw = defaults.string(forKey: languageKey), let lang = AppLanguage(rawValue: raw) {
            loadedLanguage = lang
        } else {
            loadedLanguage = .ru
        }

        // Assign all at once
        self.profiles = loadedProfiles
        self.activeProfileId = loadedActiveId
        self.records = loadedRecords
        self.language = loadedLanguage
    }

    // MARK: - Status Logic (softened: upcoming → current → monitor → discuss)

    func status(for milestone: Milestone, on date: Date = Date()) -> MilestoneStatus {
        if activeRecords[milestone.id]?.completedOn != nil {
            return .completed
        }

        let age = effectiveAgeMonths(on: date)

        // How far past due?
        let monthsPastDue = age - milestone.dueMonth

        if monthsPastDue < -2 {
            return .upcoming
        }
        if monthsPastDue < 0 {
            return .current
        }

        // Past due — flexible variants stay at current
        if milestone.isFlexibleVariant {
            return .current
        }

        // 0..2 months past due = monitor (soft)
        if monthsPastDue < 2 {
            return .monitor
        }

        // 2+ months past due = discuss
        return .discuss
    }

    /// Count of milestones in monitor state — used to escalate to discuss
    var monitorCount: Int {
        MilestoneLibrary.milestones.filter { status(for: $0) == .monitor }.count
    }

    /// True if there's a pattern of delay (2+ milestones in monitor)
    var hasDelayPattern: Bool {
        monitorCount >= 2
    }

    func effectiveAgeMonths(on date: Date = Date()) -> Double {
        AgeFormatter.correctedAgeMonths(for: profile, on: date)
    }

    func chronologicalAgeMonths(on date: Date = Date()) -> Double {
        AgeFormatter.monthsBetween(profile.birthDate, and: date)
    }

    func record(for milestone: Milestone) -> MilestoneRecord {
        activeRecords[milestone.id] ?? MilestoneRecord(completedOn: nil, observedDate: nil, note: "", wasUnchecked: false)
    }

    func toggle(_ milestone: Milestone, on date: Date = Date()) {
        var rec = record(for: milestone)
        if rec.completedOn == nil {
            rec.completedOn = date
        } else {
            rec.completedOn = nil
            rec.wasUnchecked = true
        }
        activeRecords[milestone.id] = rec
    }

    func setObservedDate(_ date: Date?, for milestone: Milestone) {
        var rec = record(for: milestone)
        rec.observedDate = date
        activeRecords[milestone.id] = rec
    }

    func updateNote(_ note: String, for milestone: Milestone) {
        var rec = record(for: milestone)
        rec.note = note
        activeRecords[milestone.id] = rec
    }

    func resetDemoData() {
        records[activeProfileId.uuidString] = [:]
    }

    // MARK: - Multi-profile

    func addProfile(_ profile: BabyProfile) {
        profiles.append(profile)
        activeProfileId = profile.id
    }

    func deleteProfile(_ profile: BabyProfile) {
        guard profiles.count > 1 else { return }
        profiles.removeAll { $0.id == profile.id }
        records.removeValue(forKey: profile.id.uuidString)
        if activeProfileId == profile.id {
            activeProfileId = profiles[0].id
        }
    }

    // MARK: - Export

    func exportSummary() -> String {
        let lang = language
        let p = profile
        var lines: [String] = []
        lines.append(p.name.isEmpty ? "Child" : p.name)
        lines.append("DOB: \(DateFormatter.localizedString(from: p.birthDate, dateStyle: .medium, timeStyle: .none))")
        lines.append("Age: \(AgeFormatter.ageText(months: effectiveAgeMonths(), language: lang))")
        if p.wasPreterm {
            lines.append("Gestational age: \(p.gestationalAgeWeeks) weeks")
        }
        lines.append("")

        let completed = MilestoneLibrary.milestones.filter { status(for: $0) == .completed }
        if !completed.isEmpty {
            lines.append("=== COMPLETED ===")
            for m in completed {
                let rec = record(for: m)
                let dateStr = rec.observedDate.map { DateFormatter.localizedString(from: $0, dateStyle: .medium, timeStyle: .none) } ?? ""
                lines.append("✓ \(m.title.text(lang)) \(dateStr)")
                if !rec.note.isEmpty { lines.append("  Note: \(rec.note)") }
            }
            lines.append("")
        }

        let concerns = MilestoneLibrary.milestones.filter { [.discuss, .monitor].contains(status(for: $0)) }
        if !concerns.isEmpty {
            lines.append("=== TO DISCUSS ===")
            for m in concerns {
                let s = status(for: m)
                let rec = record(for: m)
                lines.append("\(s == .discuss ? "⚠️" : "👁") \(m.title.text(lang)) (due \(AgeFormatter.dueText(month: m.dueMonth, language: lang)))")
                if !rec.note.isEmpty { lines.append("  Note: \(rec.note)") }
            }
            lines.append("")
        }

        lines.append("Generated by BabyMilestones app")
        return lines.joined(separator: "\n")
    }

    // MARK: - Persistence

    private func saveProfiles() {
        guard let data = try? encoder.encode(profiles) else { return }
        UserDefaults.standard.set(data, forKey: profilesKey)
    }

    private func saveActiveProfileId() {
        UserDefaults.standard.set(activeProfileId.uuidString, forKey: activeProfileKey)
    }

    private func saveRecords() {
        guard let data = try? encoder.encode(records) else { return }
        UserDefaults.standard.set(data, forKey: recordsKey)
    }

    private func saveLanguage() {
        UserDefaults.standard.set(language.rawValue, forKey: languageKey)
    }
}

// MARK: - V1 Migration Types

private struct BabyProfileV1: Codable {
    var name: String
    var birthDate: Date
    var gestationalAgeWeeks: Int
    var useCorrectedAge: Bool
}

private struct MilestoneRecordV1: Codable {
    var completedOn: Date?
    var note: String
}
