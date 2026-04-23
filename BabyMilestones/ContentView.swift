import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                TodayView()
            }
            .tabItem {
                Label("Сегодня", systemImage: "sun.max")
            }

            NavigationStack {
                MilestoneListView()
            }
            .tabItem {
                Label("Этапы", systemImage: "checklist")
            }

            NavigationStack {
                ProtocolsView()
            }
            .tabItem {
                Label("Протоколы", systemImage: "book.closed")
            }

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Профиль", systemImage: "person.crop.circle")
            }
        }
        .tint(Theme.primary)
    }
}

private enum Theme {
    static let primary = Color(red: 0.10, green: 0.36, blue: 0.42)
    static let surface = Color(.secondarySystemGroupedBackground)
    static let page = Color(.systemGroupedBackground)
    static let warning = Color(red: 0.77, green: 0.29, blue: 0.22)
}

private struct TodayView: View {
    @EnvironmentObject private var store: DevelopmentStore

    private var effectiveAge: Double { store.effectiveAgeMonths() }
    private var chronologicalAge: Double { store.chronologicalAgeMonths() }

    private var discussItems: [Milestone] {
        MilestoneLibrary.milestones.filter { store.status(for: $0) == .discuss }
    }

    private var currentItems: [Milestone] {
        MilestoneLibrary.milestones
            .filter { store.status(for: $0) == .current }
            .prefix(5)
            .map { $0 }
    }

    private var completedCount: Int {
        MilestoneLibrary.milestones.filter { store.status(for: $0) == .completed }.count
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                summaryGrid

                if !discussItems.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        SectionHeader(title: "Поводы обсудить", symbol: "exclamationmark.triangle")
                        ForEach(discussItems.prefix(4)) { milestone in
                            NavigationLink {
                                MilestoneDetailView(milestone: milestone)
                            } label: {
                                MilestoneRow(milestone: milestone, status: store.status(for: milestone), compact: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: "Актуальные этапы", symbol: "clock")
                    ForEach(currentItems) { milestone in
                        NavigationLink {
                            MilestoneDetailView(milestone: milestone)
                        } label: {
                            MilestoneRow(milestone: milestone, status: store.status(for: milestone), compact: true)
                        }
                        .buttonStyle(.plain)
                    }
                }

                EvidenceNotice()
            }
            .padding(18)
        }
        .background(Theme.page)
        .navigationTitle("Рост рядом")
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(store.profile.name.isEmpty ? "Малыш" : store.profile.name)
                .font(.largeTitle.bold())
                .foregroundStyle(.primary)
                .lineLimit(2)
                .minimumScaleFactor(0.8)

            HStack(spacing: 10) {
                Label(AgeFormatter.ageText(months: effectiveAge), systemImage: "calendar")
                    .font(.headline)
                    .foregroundStyle(Theme.primary)
                if store.profile.wasPreterm && store.profile.useCorrectedAge && chronologicalAge < 24 {
                    Text("скорректированный")
                        .font(.caption.weight(.semibold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Theme.primary.opacity(0.12), in: Capsule())
                        .foregroundStyle(Theme.primary)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var summaryGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            MetricTile(title: "Отмечено", value: "\(completedCount)", symbol: "checkmark.circle.fill", tint: .green)
            MetricTile(title: "Обсудить", value: "\(discussItems.count)", symbol: "exclamationmark.triangle.fill", tint: Theme.warning)
            MetricTile(title: "Возраст", value: AgeFormatter.ageText(months: effectiveAge), symbol: "hourglass", tint: Theme.primary)
            MetricTile(title: "Всего этапов", value: "\(MilestoneLibrary.milestones.count)", symbol: "list.bullet.clipboard", tint: .indigo)
        }
    }
}

private struct MilestoneListView: View {
    @EnvironmentObject private var store: DevelopmentStore
    @State private var selectedDomain: DevelopmentDomain?
    @State private var selectedStatus: MilestoneStatus?

    private var milestones: [Milestone] {
        MilestoneLibrary.milestones.filter { milestone in
            let domainMatches = selectedDomain == nil || milestone.domain == selectedDomain
            let statusMatches = selectedStatus == nil || store.status(for: milestone) == selectedStatus
            return domainMatches && statusMatches
        }
    }

    var body: some View {
        List {
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        FilterChip(title: "Все", symbol: "circle.grid.2x2", isSelected: selectedDomain == nil) {
                            selectedDomain = nil
                        }
                        ForEach(DevelopmentDomain.allCases) { domain in
                            FilterChip(title: domain.title, symbol: domain.symbolName, isSelected: selectedDomain == domain) {
                                selectedDomain = domain
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                Picker("Статус", selection: $selectedStatus) {
                    Text("Все").tag(nil as MilestoneStatus?)
                    ForEach(MilestoneStatus.allCases) { status in
                        Text(status.title).tag(status as MilestoneStatus?)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section {
                ForEach(milestones) { milestone in
                    NavigationLink {
                        MilestoneDetailView(milestone: milestone)
                    } label: {
                        MilestoneRow(milestone: milestone, status: store.status(for: milestone), compact: false)
                    }
                }
            }
        }
        .navigationTitle("Этапы")
    }
}

private struct MilestoneDetailView: View {
    @EnvironmentObject private var store: DevelopmentStore
    let milestone: Milestone

    @State private var noteText = ""

    private var status: MilestoneStatus {
        store.status(for: milestone)
    }

    private var record: MilestoneRecord {
        store.records[milestone.id] ?? MilestoneRecord(completedOn: nil, note: "")
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top, spacing: 12) {
                        DomainIcon(domain: milestone.domain, size: 48)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(milestone.title)
                                .font(.title2.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            StatusPill(status: status)
                        }
                    }

                    HStack(spacing: 10) {
                        Label("К \(AgeFormatter.dueText(month: milestone.dueMonth))", systemImage: "calendar.badge.clock")
                        if let range = milestone.expectedWindow {
                            Label("Окно \(AgeFormatter.dueText(month: range.lowerBound)) - \(AgeFormatter.dueText(month: range.upperBound))", systemImage: "arrow.left.and.right")
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }
                .padding(16)
                .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))

                Button {
                    store.toggle(milestone)
                } label: {
                    Label(record.completedOn == nil ? "Отметить этап" : "Убрать отметку", systemImage: record.completedOn == nil ? "checkmark.circle" : "arrow.uturn.backward.circle")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                DetailBlock(title: "Клинический смысл", symbol: "heart.text.square", text: milestone.clinicalNote)
                DetailBlock(title: "Когда говорить с врачом", symbol: "stethoscope", text: milestone.actionNote)

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: "Заметка", symbol: "note.text")
                    TextEditor(text: $noteText)
                        .frame(minHeight: 110)
                        .padding(8)
                        .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .onChange(of: noteText) { _, newValue in
                            store.updateNote(newValue, for: milestone)
                        }
                }

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: "Источники", symbol: "link")
                    ForEach(milestone.sources.compactMap(MilestoneLibrary.source)) { source in
                        Link(destination: URL(string: source.url) ?? URL(string: "https://www.cdc.gov/act-early/milestones/index.html")!) {
                            HStack(alignment: .firstTextBaseline, spacing: 10) {
                                Image(systemName: "arrow.up.right.square")
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(source.organization)
                                        .font(.subheadline.weight(.semibold))
                                    Text(source.title)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(12)
                            .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(18)
        }
        .background(Theme.page)
        .navigationTitle("Детали")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            noteText = record.note
        }
    }
}

private struct ProtocolsView: View {
    var body: some View {
        List {
            Section("Подход") {
                ProtocolRow(
                    symbol: "percent",
                    title: "Возрастные чек-листы",
                    text: "CDC использует этапы, которые большинство детей - 75% или более - обычно достигает к указанному возрасту."
                )
                ProtocolRow(
                    symbol: "waveform.path.ecg",
                    title: "Не диагноз",
                    text: "Отсутствие одного этапа не ставит диагноз. Потеря навыка, регресс или совокупность задержек требуют очной оценки."
                )
                ProtocolRow(
                    symbol: "calendar.badge.checkmark",
                    title: "Скрининг",
                    text: "AAP рекомендует общий скрининг развития в 9, 18 и 30 месяцев, ASD-скрининг в 18 и 24 месяца."
                )
                ProtocolRow(
                    symbol: "figure.child",
                    title: "Недоношенность",
                    text: "До 2 лет развитие недоношенного ребенка обычно оценивают по скорректированному возрасту."
                )
            }

            Section("Красные флаги") {
                Text("Обсудите с врачом без ожидания, если ребенок потерял уже освоенный навык, не реагирует на звуки, заметно хуже двигает одной стороной тела, не ест безопасные текстуры, перестал общаться или у вас есть стойкая тревога.")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.vertical, 6)
            }

            Section("Источники") {
                ForEach(MilestoneLibrary.sources) { source in
                    Link(destination: URL(string: source.url) ?? URL(string: "https://www.cdc.gov/act-early/milestones/index.html")!) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(source.organization)
                                .font(.headline)
                            Text(source.title)
                                .font(.subheadline)
                                .foregroundStyle(Theme.primary)
                            Text(source.note)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
        }
        .navigationTitle("Протоколы")
    }
}

private struct ProfileView: View {
    @EnvironmentObject private var store: DevelopmentStore

    var body: some View {
        Form {
            Section("Ребенок") {
                TextField("Имя", text: $store.profile.name)
                DatePicker("Дата рождения", selection: $store.profile.birthDate, displayedComponents: .date)
                Stepper(value: $store.profile.gestationalAgeWeeks, in: 22...42) {
                    HStack {
                        Text("Гестационный возраст")
                        Spacer()
                        Text("\(store.profile.gestationalAgeWeeks) нед.")
                            .foregroundStyle(.secondary)
                    }
                }
                Toggle("Использовать скорректированный возраст", isOn: $store.profile.useCorrectedAge)
                    .disabled(!store.profile.wasPreterm)
            }

            Section("Возраст") {
                LabeledContent("Хронологический", value: AgeFormatter.ageText(months: store.chronologicalAgeMonths()))
                LabeledContent("Для этапов", value: AgeFormatter.ageText(months: store.effectiveAgeMonths()))
                if store.profile.wasPreterm {
                    Text("Скорректированный возраст помогает не считать нормальное дозревание недоношенного ребенка задержкой. После 2 лет большинство детей уже сравнивают по хронологическому возрасту.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }

            Section {
                Button(role: .destructive) {
                    store.resetDemoData()
                } label: {
                    Label("Сбросить отметки", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Профиль")
    }
}

private struct MilestoneRow: View {
    let milestone: Milestone
    let status: MilestoneStatus
    let compact: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            DomainIcon(domain: milestone.domain, size: compact ? 36 : 42)

            VStack(alignment: .leading, spacing: 6) {
                Text(milestone.title)
                    .font(compact ? .subheadline.weight(.semibold) : .body.weight(.semibold))
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                HStack(spacing: 8) {
                    Text(milestone.domain.title)
                    Text("к \(AgeFormatter.dueText(month: milestone.dueMonth))")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer(minLength: 8)
            StatusIcon(status: status)
        }
        .padding(compact ? 12 : 6)
        .background(compact ? Theme.surface : Color.clear, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct DomainIcon: View {
    let domain: DevelopmentDomain
    let size: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(domain.tint.opacity(0.14))
            Image(systemName: domain.symbolName)
                .font(.system(size: size * 0.42, weight: .semibold))
                .foregroundStyle(domain.tint)
        }
        .frame(width: size, height: size)
    }
}

private struct StatusIcon: View {
    let status: MilestoneStatus

    var body: some View {
        Image(systemName: status.symbolName)
            .foregroundStyle(status.tint)
            .font(.title3)
            .accessibilityLabel(status.title)
    }
}

private struct StatusPill: View {
    let status: MilestoneStatus

    var body: some View {
        Label(status.title, systemImage: status.symbolName)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(status.tint.opacity(0.12), in: Capsule())
            .foregroundStyle(status.tint)
    }
}

private struct FilterChip: View {
    let title: String
    let symbol: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: symbol)
                .font(.subheadline.weight(.semibold))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Theme.primary : Color(.tertiarySystemGroupedBackground), in: Capsule())
                .foregroundStyle(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
    }
}

private struct MetricTile: View {
    let title: String
    let value: String
    let symbol: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: symbol)
                .foregroundStyle(tint)
                .font(.title3)
            Text(value)
                .font(.title3.bold())
                .foregroundStyle(.primary)
                .lineLimit(2)
                .minimumScaleFactor(0.7)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 112, alignment: .topLeading)
        .padding(14)
        .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct SectionHeader: View {
    let title: String
    let symbol: String

    var body: some View {
        Label(title, systemImage: symbol)
            .font(.headline)
            .foregroundStyle(.primary)
    }
}

private struct DetailBlock: View {
    let title: String
    let symbol: String
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeader(title: title, symbol: symbol)
            Text(text)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct ProtocolRow: View {
    let symbol: String
    let title: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: symbol)
                .frame(width: 28, height: 28)
                .foregroundStyle(Theme.primary)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(text)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

private struct EvidenceNotice: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "cross.case")
                .foregroundStyle(Theme.primary)
                .font(.title3)
            Text("Приложение помогает наблюдать развитие и готовить вопросы к врачу. Оно не заменяет осмотр, скрининг или индивидуальные рекомендации для недоношенных и детей с медицинскими особенностями.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .background(Theme.surface, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
