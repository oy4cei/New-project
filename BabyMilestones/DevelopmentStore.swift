import Foundation

final class DevelopmentStore: ObservableObject {
    @Published var profile: BabyProfile {
        didSet { saveProfile() }
    }

    @Published var records: [String: MilestoneRecord] {
        didSet { saveRecords() }
    }

    private let profileKey = "baby-profile-v1"
    private let recordsKey = "milestone-records-v1"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(defaults: UserDefaults = .standard) {
        if let data = defaults.data(forKey: profileKey),
           let storedProfile = try? decoder.decode(BabyProfile.self, from: data) {
            profile = storedProfile
        } else {
            profile = .sample
        }

        if let data = defaults.data(forKey: recordsKey),
           let storedRecords = try? decoder.decode([String: MilestoneRecord].self, from: data) {
            records = storedRecords
        } else {
            records = [:]
        }
    }

    func status(for milestone: Milestone, on date: Date = Date()) -> MilestoneStatus {
        if records[milestone.id]?.completedOn != nil {
            return .completed
        }

        let age = effectiveAgeMonths(on: date)
        if age >= milestone.dueMonth {
            return milestone.isFlexibleVariant ? .current : .discuss
        }
        if milestone.dueMonth - age <= 2 {
            return .current
        }
        return .upcoming
    }

    func effectiveAgeMonths(on date: Date = Date()) -> Double {
        AgeFormatter.correctedAgeMonths(for: profile, on: date)
    }

    func chronologicalAgeMonths(on date: Date = Date()) -> Double {
        AgeFormatter.monthsBetween(profile.birthDate, and: date)
    }

    func toggle(_ milestone: Milestone, on date: Date = Date()) {
        var record = records[milestone.id] ?? MilestoneRecord(completedOn: nil, note: "")
        record.completedOn = record.completedOn == nil ? date : nil
        records[milestone.id] = record
    }

    func updateNote(_ note: String, for milestone: Milestone) {
        var record = records[milestone.id] ?? MilestoneRecord(completedOn: nil, note: "")
        record.note = note
        records[milestone.id] = record
    }

    func resetDemoData() {
        records = [:]
    }

    private func saveProfile() {
        guard let data = try? encoder.encode(profile) else { return }
        UserDefaults.standard.set(data, forKey: profileKey)
    }

    private func saveRecords() {
        guard let data = try? encoder.encode(records) else { return }
        UserDefaults.standard.set(data, forKey: recordsKey)
    }
}
