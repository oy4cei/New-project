import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case system, light, dark
    var id: String { rawValue }

    func title(language: AppLanguage) -> String {
        switch (self, language) {
        case (.system, .en): return "System"
        case (.system, .ru): return "Системная"
        case (.system, .uk): return "Системна"
        case (.light, .en): return "Light"
        case (.light, .ru): return "Светлая"
        case (.light, .uk): return "Світла"
        case (.dark, .en): return "Dark"
        case (.dark, .ru): return "Темная"
        case (.dark, .uk): return "Темна"
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

private extension Color {
    static func dynamic(light: UIColor, dark: UIColor) -> Color {
        Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? dark : light
        })
    }
}

struct ContentView: View {
    @EnvironmentObject private var store: DevelopmentStore
    @AppStorage("appThemePreference") private var appTheme: AppTheme = .system

    var body: some View {
        TabView {
            NavigationStack {
                TodayView()
            }
            .tabItem {
                Label(L10n.tabToday(store.language), systemImage: "sun.max")
            }

            NavigationStack {
                MilestoneListView()
            }
            .tabItem {
                Label(L10n.tabMilestones(store.language), systemImage: "checklist")
            }

            NavigationStack {
                ProtocolsView()
            }
            .tabItem {
                Label(L10n.tabProtocols(store.language), systemImage: "book.closed")
            }

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label(L10n.tabProfile(store.language), systemImage: "person.crop.circle")
            }
        }
        .tint(Theme.primary)
        .fontDesign(.rounded)
        .preferredColorScheme(appTheme.colorScheme)
    }
}

private enum Theme {
    static let primary = Color.dynamic(
        light: UIColor(red: 0.45, green: 0.50, blue: 0.82, alpha: 1.0),
        dark: UIColor(red: 0.55, green: 0.60, blue: 0.95, alpha: 1.0)
    )
    static let accent = Color.dynamic(
        light: UIColor(red: 0.76, green: 0.48, blue: 0.72, alpha: 1.0),
        dark: UIColor(red: 0.85, green: 0.50, blue: 0.80, alpha: 1.0)
    )
    static let surface = Color.dynamic(
        light: UIColor.white,
        dark: UIColor(red: 0.12, green: 0.12, blue: 0.16, alpha: 1.0)
    )
    static let page = Color.dynamic(
        light: UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.0),
        dark: UIColor(red: 0.06, green: 0.06, blue: 0.08, alpha: 1.0)
    )
    static let warning = Color.dynamic(
        light: UIColor(red: 0.92, green: 0.52, blue: 0.42, alpha: 1.0),
        dark: UIColor(red: 0.95, green: 0.58, blue: 0.50, alpha: 1.0)
    )
    static let monitor = Color.dynamic(
        light: UIColor(red: 0.45, green: 0.68, blue: 0.90, alpha: 1.0),
        dark: UIColor(red: 0.50, green: 0.75, blue: 0.95, alpha: 1.0)
    )
    static let success = Color.dynamic(
        light: UIColor(red: 0.38, green: 0.78, blue: 0.58, alpha: 1.0),
        dark: UIColor(red: 0.42, green: 0.82, blue: 0.62, alpha: 1.0)
    )
    static let cardRadius: CGFloat = 28
    static let buttonRadius: CGFloat = 20

    static let headerGradient = LinearGradient(
        colors: [
            Color.dynamic(
                light: UIColor(red: 0.45, green: 0.50, blue: 0.82, alpha: 0.25),
                dark: UIColor(red: 0.20, green: 0.15, blue: 0.35, alpha: 1.0)
            ),
            Color.dynamic(
                light: UIColor(red: 0.76, green: 0.48, blue: 0.72, alpha: 0.12),
                dark: UIColor(red: 0.06, green: 0.06, blue: 0.08, alpha: 1.0)
            )
        ],
        startPoint: .top, endPoint: .bottom
    )

    static let cardShadow = Color.dynamic(
        light: UIColor(white: 0.0, alpha: 0.06),
        dark: UIColor(white: 0.0, alpha: 0.40)
    )
}

private enum L10n {
    private static func text(_ language: AppLanguage, ru: String, uk: String, en: String) -> String {
        switch language {
        case .uk: uk
        case .en: en
        case .ru: ru
        }
    }

    static func appTitle(_ language: AppLanguage) -> String {
        "Evie"
    }

    static func babyFallback(_ language: AppLanguage) -> String {
        text(language, ru: "Малыш", uk: "Малюк", en: "Baby")
    }

    static func tabToday(_ language: AppLanguage) -> String {
        text(language, ru: "Сегодня", uk: "Сьогодні", en: "Today")
    }

    static func tabMilestones(_ language: AppLanguage) -> String {
        text(language, ru: "Этапы", uk: "Етапи", en: "Milestones")
    }

    static func tabProtocols(_ language: AppLanguage) -> String {
        text(language, ru: "Протоколы", uk: "Протоколи", en: "Protocols")
    }

    static func tabProfile(_ language: AppLanguage) -> String {
        text(language, ru: "Профиль", uk: "Профіль", en: "Profile")
    }

    static func discussReasons(_ language: AppLanguage) -> String {
        text(language, ru: "Поводы обсудить", uk: "Приводи обговорити", en: "Reasons to Discuss")
    }

    static func currentMilestones(_ language: AppLanguage) -> String {
        text(language, ru: "Актуальные этапы", uk: "Актуальні етапи", en: "Current Milestones")
    }

    static func completed(_ language: AppLanguage) -> String {
        text(language, ru: "Отмечено", uk: "Позначено", en: "Done")
    }

    static func discuss(_ language: AppLanguage) -> String {
        text(language, ru: "Обсудить", uk: "Обговорити", en: "Discuss")
    }

    static func age(_ language: AppLanguage) -> String {
        text(language, ru: "Возраст", uk: "Вік", en: "Age")
    }

    static func totalMilestones(_ language: AppLanguage) -> String {
        text(language, ru: "Всего этапов", uk: "Усього етапів", en: "Total")
    }

    static func corrected(_ language: AppLanguage) -> String {
        text(language, ru: "скорректированный", uk: "скоригований", en: "corrected")
    }

    static func all(_ language: AppLanguage) -> String {
        text(language, ru: "Все", uk: "Усі", en: "All")
    }

    static func status(_ language: AppLanguage) -> String {
        text(language, ru: "Статус", uk: "Статус", en: "Status")
    }

    static func details(_ language: AppLanguage) -> String {
        text(language, ru: "Детали", uk: "Деталі", en: "Details")
    }

    static func byAge(_ value: String, language: AppLanguage) -> String {
        switch language {
        case .uk: "до \(value)"
        case .en: "by \(value)"
        case .ru: "к \(value)"
        }
    }

    static func window(_ lower: String, _ upper: String, language: AppLanguage) -> String {
        switch language {
        case .uk: "Вікно \(lower) - \(upper)"
        case .en: "Window \(lower) - \(upper)"
        case .ru: "Окно \(lower) - \(upper)"
        }
    }

    static func markMilestone(_ language: AppLanguage) -> String {
        text(language, ru: "Отметить этап", uk: "Позначити етап", en: "Mark milestone")
    }

    static func unmarkMilestone(_ language: AppLanguage) -> String {
        text(language, ru: "Убрать отметку", uk: "Прибрати позначку", en: "Remove mark")
    }

    static func clinicalMeaning(_ language: AppLanguage) -> String {
        text(language, ru: "Клинический смысл", uk: "Клінічний сенс", en: "Clinical Meaning")
    }

    static func whenTalkDoctor(_ language: AppLanguage) -> String {
        text(language, ru: "Когда говорить с врачом", uk: "Коли говорити з лікарем", en: "When to Talk to a Clinician")
    }

    static func note(_ language: AppLanguage) -> String {
        text(language, ru: "Заметка", uk: "Нотатка", en: "Note")
    }

    static func sources(_ language: AppLanguage) -> String {
        text(language, ru: "Источники", uk: "Джерела", en: "Sources")
    }

    static func approach(_ language: AppLanguage) -> String {
        text(language, ru: "Подход", uk: "Підхід", en: "Approach")
    }

    static func protocolAgeChecklistsTitle(_ language: AppLanguage) -> String {
        text(language, ru: "Возрастные чек-листы", uk: "Вікові чек-листи", en: "Age Checklists")
    }

    static func protocolAgeChecklistsText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "CDC использует этапы, которые большинство детей - 75% или более - обычно достигает к указанному возрасту.",
            uk: "CDC використовує етапи, яких більшість дітей - 75% або більше - зазвичай досягає до вказаного віку.",
            en: "CDC uses milestones that most children - 75% or more - usually reach by the listed age."
        )
    }

    static func protocolNotDiagnosisTitle(_ language: AppLanguage) -> String {
        text(language, ru: "Не диагноз", uk: "Не діагноз", en: "Not a Diagnosis")
    }

    static func protocolNotDiagnosisText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Отсутствие одного этапа не ставит диагноз. Потеря навыка, регресс или совокупность задержек требуют очной оценки.",
            uk: "Відсутність одного етапу не ставить діагноз. Втрата навички, регрес або сукупність затримок потребують очної оцінки.",
            en: "Missing one milestone does not make a diagnosis. Skill loss, regression, or several delays need in-person evaluation."
        )
    }

    static func protocolScreeningTitle(_ language: AppLanguage) -> String {
        text(language, ru: "Скрининг", uk: "Скринінг", en: "Screening")
    }

    static func protocolScreeningText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "AAP рекомендует общий скрининг развития в 9, 18 и 30 месяцев, ASD-скрининг в 18 и 24 месяца.",
            uk: "AAP рекомендує загальний скринінг розвитку у 9, 18 і 30 місяців, ASD-скринінг у 18 і 24 місяці.",
            en: "AAP recommends general developmental screening at 9, 18, and 30 months, and ASD screening at 18 and 24 months."
        )
    }

    static func protocolPretermTitle(_ language: AppLanguage) -> String {
        text(language, ru: "Недоношенность", uk: "Недоношеність", en: "Prematurity")
    }

    static func protocolPretermText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "До 2 лет развитие недоношенного ребенка обычно оценивают по скорректированному возрасту.",
            uk: "До 2 років розвиток недоношеної дитини зазвичай оцінюють за скоригованим віком.",
            en: "Until age 2, preterm children are usually assessed using corrected age."
        )
    }

    static func redFlags(_ language: AppLanguage) -> String {
        text(language, ru: "Красные флаги", uk: "Червоні прапорці", en: "Red Flags")
    }

    static func redFlagsText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Обсудите с врачом без ожидания, если ребенок потерял уже освоенный навык, не реагирует на звуки, заметно хуже двигает одной стороной тела, не ест безопасные текстуры, перестал общаться или у вас есть стойкая тревога.",
            uk: "Обговоріть із лікарем без очікування, якщо дитина втратила вже освоєну навичку, не реагує на звуки, помітно гірше рухає однією стороною тіла, не їсть безпечні текстури, перестала спілкуватися або у вас є стійка тривога.",
            en: "Talk to a clinician without waiting if the child loses a skill, does not react to sounds, moves one side much less, cannot manage safe textures, stops engaging, or you have a persistent concern."
        )
    }

    static func child(_ language: AppLanguage) -> String {
        text(language, ru: "Ребенок", uk: "Дитина", en: "Child")
    }

    static func name(_ language: AppLanguage) -> String {
        text(language, ru: "Имя", uk: "Ім'я", en: "Name")
    }

    static func birthDate(_ language: AppLanguage) -> String {
        text(language, ru: "Дата рождения", uk: "Дата народження", en: "Date of Birth")
    }

    static func gestationalAge(_ language: AppLanguage) -> String {
        text(language, ru: "Гестационный возраст", uk: "Гестаційний вік", en: "Gestational Age")
    }

    static func weekAbbreviation(_ language: AppLanguage) -> String {
        text(language, ru: "нед.", uk: "тиж.", en: "wk")
    }

    static func useCorrectedAge(_ language: AppLanguage) -> String {
        text(language, ru: "Использовать скорректированный возраст", uk: "Використовувати скоригований вік", en: "Use corrected age")
    }

    static func chronological(_ language: AppLanguage) -> String {
        text(language, ru: "Хронологический", uk: "Хронологічний", en: "Chronological")
    }

    static func forMilestones(_ language: AppLanguage) -> String {
        text(language, ru: "Для этапов", uk: "Для етапів", en: "For Milestones")
    }

    static func correctedHelp(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Скорректированный возраст помогает не считать нормальное дозревание недоношенного ребенка задержкой. После 2 лет большинство детей уже сравнивают по хронологическому возрасту.",
            uk: "Скоригований вік допомагає не вважати нормальне дозрівання недоношеної дитини затримкою. Після 2 років більшість дітей уже порівнюють за хронологічним віком.",
            en: "Corrected age helps avoid labeling normal maturation in a preterm child as delay. After age 2, most children are compared by chronological age."
        )
    }

    static func resetMarks(_ language: AppLanguage) -> String {
        text(language, ru: "Сбросить отметки", uk: "Скинути позначки", en: "Reset marks")
    }

    static func languageSection(_ language: AppLanguage) -> String {
        text(language, ru: "Язык", uk: "Мова", en: "Language")
    }

    static func appLanguage(_ language: AppLanguage) -> String {
        text(language, ru: "Язык приложения", uk: "Мова застосунку", en: "App Language")
    }

    static func appTheme(_ language: AppLanguage) -> String {
        text(language, ru: "Оформление", uk: "Оформлення", en: "Theme")
    }

    static func evidenceNotice(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Приложение помогает наблюдать развитие и готовить вопросы к врачу. Оно не является медицинским изделием, не предназначено для диагностики и не заменяет осмотр, скрининг или индивидуальные рекомендации специалиста.",
            uk: "Застосунок допомагає спостерігати за розвитком і готувати питання до лікаря. Він не є медичним виробом, не призначений для діагностики й не замінює огляд, скринінг або індивідуальні рекомендації фахівця.",
            en: "This app helps track development and prepare questions for a clinician. It is not a medical device, not intended for diagnosis, and does not replace examination, screening, or individual specialist guidance."
        )
    }

    static func monitorMilestones(_ language: AppLanguage) -> String {
        text(language, ru: "На наблюдении", uk: "На спостереженні", en: "Monitoring")
    }

    static func patternWarning(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Несколько навыков на наблюдении одновременно. Это может быть вариантом нормы, но стоит обсудить с педиатром на ближайшем визите.",
            uk: "Кілька навичок на спостереженні одночасно. Це може бути варіантом норми, але варто обговорити з педіатром на найближчому візиті.",
            en: "Several milestones are being monitored at once. This may be normal variation, but it is worth discussing with a pediatrician at the next visit."
        )
    }

    static func percentileContext(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Этот возраст означает, что 75% детей уже освоили навык. Каждый четвёртый здоровый ребёнок осваивает позже — и это нормально.",
            uk: "Цей вік означає, що 75% дітей уже освоїли навичку. Кожна четверта здорова дитина освоює пізніше — і це нормально.",
            en: "This age means 75% of children have already mastered this skill. Every fourth healthy child masters it later — and that is normal."
        )
    }

    static func exportForDoctor(_ language: AppLanguage) -> String {
        text(language, ru: "Экспорт для врача", uk: "Експорт для лікаря", en: "Export for Doctor")
    }

    static func addChild(_ language: AppLanguage) -> String {
        text(language, ru: "Добавить ребенка", uk: "Додати дитину", en: "Add Child")
    }

    static func children(_ language: AppLanguage) -> String {
        text(language, ru: "Дети", uk: "Діти", en: "Children")
    }

    static func notADelay(_ language: AppLanguage) -> String {
        text(language, ru: "Это НЕ задержка", uk: "Це НЕ затримка", en: "This is NOT a delay")
    }

    static func notADelayText(_ language: AppLanguage) -> String {
        text(
            language,
            ru: "Один отсутствующий навык — это почти никогда не диагноз. Совокупность задержек в нескольких доменах — повод для внимания. Каждый ребенок развивается в своем темпе.",
            uk: "Одна відсутня навичка — це майже ніколи не діагноз. Сукупність затримок у кількох доменах — привід для уваги. Кожна дитина розвивається у своєму темпі.",
            en: "One missing skill is almost never a diagnosis. A pattern of delays across several domains is a reason for attention. Every child develops at their own pace."
        )
    }

    static func observedDate(_ language: AppLanguage) -> String {
        text(language, ru: "Когда заметили", uk: "Коли помітили", en: "When noticed")
    }
}

private struct TodayView: View {
    @EnvironmentObject private var store: DevelopmentStore

    private var language: AppLanguage { store.language }
    private var effectiveAge: Double { store.effectiveAgeMonths() }
    private var chronologicalAge: Double { store.chronologicalAgeMonths() }

    private var discussItems: [Milestone] {
        MilestoneLibrary.milestones.filter { store.status(for: $0) == .discuss }
    }

    private var monitorItems: [Milestone] {
        MilestoneLibrary.milestones.filter { store.status(for: $0) == .monitor }
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
                        SectionHeader(title: L10n.discussReasons(language), symbol: "exclamationmark.triangle")
                        ForEach(discussItems.prefix(4)) { milestone in
                            NavigationLink {
                                MilestoneDetailView(milestone: milestone)
                            } label: {
                                MilestoneRow(milestone: milestone, status: store.status(for: milestone), language: language, compact: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                if !monitorItems.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        SectionHeader(title: L10n.monitorMilestones(language), symbol: "eye")
                        if store.hasDelayPattern {
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "info.circle.fill")
                                    .foregroundStyle(Theme.monitor)
                                Text(L10n.patternWarning(language))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(14)
                            .background(Theme.monitor.opacity(0.10), in: RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous))
                        }
                        ForEach(monitorItems.prefix(4)) { milestone in
                            NavigationLink {
                                MilestoneDetailView(milestone: milestone)
                            } label: {
                                MilestoneRow(milestone: milestone, status: store.status(for: milestone), language: language, compact: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: L10n.currentMilestones(language), symbol: "clock")
                    ForEach(currentItems) { milestone in
                        NavigationLink {
                            MilestoneDetailView(milestone: milestone)
                        } label: {
                            MilestoneRow(milestone: milestone, status: store.status(for: milestone), language: language, compact: true)
                        }
                        .buttonStyle(.plain)
                    }
                }

                // Anti-anxiety block
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 8) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundStyle(Theme.success)
                            .font(.title3)
                        Text(L10n.notADelay(language))
                            .font(.headline)
                    }
                    Text(L10n.notADelayText(language))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [Theme.success.opacity(0.10), Theme.success.opacity(0.04)],
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: Theme.success.opacity(0.10), radius: 8, x: 0, y: 3)
                }

                EvidenceNotice(language: language)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 24)
        }
        .background(
            ZStack {
                Theme.page
                VStack {
                    Theme.headerGradient
                        .frame(height: 320)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        )
        .navigationTitle(L10n.appTitle(language))
    }

    private var header: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Theme.primary.opacity(0.15), lineWidth: 8)
                    .frame(width: 140, height: 140)
                
                // Example visual progress ring (can be animated or tied to actual progress)
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(
                        LinearGradient(colors: [Theme.primary, Theme.accent], startPoint: .topLeading, endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: 140, height: 140)
                    .rotationEffect(.degrees(-90))
                
                ZStack {
                    Circle()
                        .fill(Theme.surface)
                        .frame(width: 120, height: 120)
                        .shadow(color: Theme.cardShadow, radius: 8, x: 0, y: 4)
                    
                    Image(systemName: "face.smiling")
                        .font(.system(size: 50, weight: .light))
                        .foregroundStyle(Theme.primary)
                }
            }
            .padding(.top, 10)
            
            VStack(spacing: 4) {
                Text(store.profile.name.isEmpty ? L10n.babyFallback(language) : store.profile.name)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.primary)
                
                HStack(spacing: 8) {
                    Text(AgeFormatter.ageText(months: effectiveAge, language: language))
                        .font(.headline)
                        .foregroundStyle(Theme.primary)
                    
                    if store.profile.wasPreterm && store.profile.useCorrectedAge && chronologicalAge < 24 {
                        Text(L10n.corrected(language))
                            .font(.caption2.weight(.bold))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Theme.primary.opacity(0.12), in: Capsule())
                            .foregroundStyle(Theme.primary)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background {
            RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                .fill(Theme.surface.opacity(0.6))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous))
                .shadow(color: Theme.cardShadow, radius: 12, x: 0, y: 6)
        }
    }

    private var summaryGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            MetricTile(title: L10n.completed(language), value: "\(completedCount)", symbol: "checkmark.circle.fill", tint: Theme.success)
            MetricTile(title: L10n.monitorMilestones(language), value: "\(monitorItems.count)", symbol: "eye.fill", tint: Theme.monitor)
            MetricTile(title: L10n.discuss(language), value: "\(discussItems.count)", symbol: "exclamationmark.triangle.fill", tint: Theme.warning)
            MetricTile(title: L10n.totalMilestones(language), value: "\(MilestoneLibrary.milestones.count)", symbol: "list.bullet.clipboard.fill", tint: Theme.primary)
        }
    }
}

private struct MilestoneListView: View {
    @EnvironmentObject private var store: DevelopmentStore
    @State private var selectedDomain: DevelopmentDomain?
    @State private var selectedStatus: MilestoneStatus?

    private var language: AppLanguage { store.language }

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
                        FilterChip(title: L10n.all(language), symbol: "circle.grid.2x2", isSelected: selectedDomain == nil) {
                            selectedDomain = nil
                        }
                        ForEach(DevelopmentDomain.allCases) { domain in
                            FilterChip(title: domain.title(language), symbol: domain.symbolName, isSelected: selectedDomain == domain) {
                                selectedDomain = domain
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                Picker(L10n.status(language), selection: $selectedStatus) {
                    Text(L10n.all(language)).tag(nil as MilestoneStatus?)
                    ForEach(MilestoneStatus.allCases) { status in
                        Text(status.title(language)).tag(status as MilestoneStatus?)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section {
                ForEach(milestones) { milestone in
                    NavigationLink {
                        MilestoneDetailView(milestone: milestone)
                    } label: {
                        MilestoneRow(milestone: milestone, status: store.status(for: milestone), language: language, compact: false)
                    }
                }
            }
        }
        .navigationTitle(L10n.tabMilestones(language))
    }
}

private struct MilestoneDetailView: View {
    @EnvironmentObject private var store: DevelopmentStore
    let milestone: Milestone

    @State private var noteText = ""

    private var language: AppLanguage { store.language }

    private var status: MilestoneStatus {
        store.status(for: milestone)
    }

    private var record: MilestoneRecord {
        store.record(for: milestone)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top, spacing: 12) {
                        DomainIcon(domain: milestone.domain, size: 48)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(milestone.title.text(language))
                                .font(.title2.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            StatusPill(status: status, language: language)
                        }
                    }

                    HStack(spacing: 10) {
                        Label(L10n.byAge(AgeFormatter.dueText(month: milestone.dueMonth, language: language), language: language), systemImage: "calendar.badge.clock")
                        if let range = milestone.expectedWindow {
                            Label(
                                L10n.window(
                                    AgeFormatter.dueText(month: range.lowerBound, language: language),
                                    AgeFormatter.dueText(month: range.upperBound, language: language),
                                    language: language
                                ),
                                systemImage: "arrow.left.and.right"
                            )
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                        .fill(Theme.surface)
                        .shadow(color: Theme.cardShadow, radius: 8, x: 0, y: 3)
                }

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        store.toggle(milestone)
                    }
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: record.completedOn == nil ? "checkmark.circle.fill" : "arrow.uturn.backward.circle.fill")
                            .font(.title3)
                        Text(record.completedOn == nil ? L10n.markMilestone(language) : L10n.unmarkMilestone(language))
                            .font(.body.weight(.bold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: Theme.buttonRadius, style: .continuous)
                            .fill(record.completedOn == nil
                                  ? LinearGradient(colors: [Theme.primary, Theme.accent], startPoint: .leading, endPoint: .trailing)
                                  : LinearGradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.2)], startPoint: .leading, endPoint: .trailing)
                            )
                            .shadow(color: Theme.primary.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                    .foregroundStyle(record.completedOn == nil ? .white : .primary)
                }
                .buttonStyle(.plain)

                if record.completedOn != nil {
                    VStack(alignment: .leading, spacing: 8) {
                        SectionHeader(title: L10n.observedDate(language), symbol: "calendar")
                        DatePicker("", selection: Binding(
                            get: { record.observedDate ?? record.completedOn ?? Date() },
                            set: { store.setObservedDate($0, for: milestone) }
                        ), displayedComponents: .date)
                        .labelsHidden()
                    }
                    .padding(18)
                    .background {
                        RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                            .fill(Theme.surface)
                            .shadow(color: Theme.cardShadow, radius: 6, x: 0, y: 2)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }

                // 75th percentile context
                if milestone.evidence == .cdc75 {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "chart.bar.fill")
                            .foregroundStyle(Theme.primary)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(milestone.evidence.title(language))
                                .font(.subheadline.weight(.semibold))
                            Text(L10n.percentileContext(language))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(18)
                    .background {
                        RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                            .fill(Theme.primary.opacity(0.08))
                    }
                }

                DetailBlock(title: L10n.clinicalMeaning(language), symbol: "heart.text.square", text: milestone.clinicalNote.text(language))
                DetailBlock(title: L10n.whenTalkDoctor(language), symbol: "stethoscope", text: milestone.actionNote.text(language))

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: L10n.note(language), symbol: "note.text")
                    TextEditor(text: $noteText)
                        .frame(minHeight: 110)
                        .padding(12)
                        .background {
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Theme.page)
                        }
                        .onChange(of: noteText) { _, newValue in
                            store.updateNote(newValue, for: milestone)
                        }
                }

                VStack(alignment: .leading, spacing: 10) {
                    SectionHeader(title: L10n.sources(language), symbol: "link")
                    ForEach(milestone.sources.compactMap(MilestoneLibrary.source)) { source in
                        Link(destination: URL(string: source.url) ?? URL(string: "https://www.cdc.gov/act-early/milestones/index.html")!) {
                            HStack(alignment: .firstTextBaseline, spacing: 10) {
                                Image(systemName: "arrow.up.right.square")
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(source.organization.text(language))
                                        .font(.subheadline.weight(.semibold))
                                    Text(source.title.text(language))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(14)
                            .background(Theme.surface, in: RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
        }
        .background(Theme.page)
        .navigationTitle(L10n.details(language))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            noteText = record.note
        }
    }
}

private struct ProtocolsView: View {
    @EnvironmentObject private var store: DevelopmentStore

    private var language: AppLanguage { store.language }

    var body: some View {
        List {
            Section(L10n.approach(language)) {
                ProtocolRow(
                    symbol: "percent",
                    title: L10n.protocolAgeChecklistsTitle(language),
                    text: L10n.protocolAgeChecklistsText(language)
                )
                ProtocolRow(
                    symbol: "waveform.path.ecg",
                    title: L10n.protocolNotDiagnosisTitle(language),
                    text: L10n.protocolNotDiagnosisText(language)
                )
                ProtocolRow(
                    symbol: "calendar.badge.checkmark",
                    title: L10n.protocolScreeningTitle(language),
                    text: L10n.protocolScreeningText(language)
                )
                ProtocolRow(
                    symbol: "figure.child",
                    title: L10n.protocolPretermTitle(language),
                    text: L10n.protocolPretermText(language)
                )
            }

            Section(L10n.redFlags(language)) {
                Text(L10n.redFlagsText(language))
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.vertical, 6)
            }

            Section(L10n.notADelay(language)) {
                Text(L10n.notADelayText(language))
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.vertical, 6)
            }

            Section(L10n.sources(language)) {
                ForEach(MilestoneLibrary.sources) { source in
                    Link(destination: URL(string: source.url) ?? URL(string: "https://www.cdc.gov/act-early/milestones/index.html")!) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(source.organization.text(language))
                                .font(.headline)
                            Text(source.title.text(language))
                                .font(.subheadline)
                                .foregroundStyle(Theme.primary)
                            Text(source.note.text(language))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
        }
        .navigationTitle(L10n.tabProtocols(language))
    }
}

private struct ProfileView: View {
    @EnvironmentObject private var store: DevelopmentStore
    @AppStorage("appThemePreference") private var appTheme: AppTheme = .system
    @State private var showingExport = false

    private var language: AppLanguage { store.language }

    var body: some View {
        Form {
            Section(L10n.languageSection(language)) {
                Picker(L10n.appLanguage(language), selection: $store.language) {
                    ForEach(AppLanguage.allCases) { language in
                        Text(language.nativeName).tag(language)
                    }
                }
                .pickerStyle(.segmented)
                
                Picker(L10n.appTheme(language), selection: $appTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.title(language: language)).tag(theme)
                    }
                }
                .pickerStyle(.segmented)
            }

            if store.profiles.count > 1 {
                Section(L10n.children(language)) {
                    ForEach(store.profiles) { profile in
                        Button {
                            store.activeProfileId = profile.id
                        } label: {
                            HStack {
                                Text(profile.name.isEmpty ? L10n.babyFallback(language) : profile.name)
                                Spacer()
                                if profile.id == store.activeProfileId {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Theme.primary)
                                }
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                    .onDelete { offsets in
                        for idx in offsets {
                            store.deleteProfile(store.profiles[idx])
                        }
                    }
                }
            }

            Section(L10n.child(language)) {
                TextField(L10n.name(language), text: $store.profile.name)
                DatePicker(L10n.birthDate(language), selection: $store.profile.birthDate, displayedComponents: .date)
                Stepper(value: $store.profile.gestationalAgeWeeks, in: 22...42) {
                    HStack {
                        Text(L10n.gestationalAge(language))
                        Spacer()
                        Text("\(store.profile.gestationalAgeWeeks) \(L10n.weekAbbreviation(language))")
                            .foregroundStyle(.secondary)
                    }
                }
                Toggle(L10n.useCorrectedAge(language), isOn: $store.profile.useCorrectedAge)
                    .disabled(!store.profile.wasPreterm)
            }

            Section(L10n.age(language)) {
                LabeledContent(L10n.chronological(language), value: AgeFormatter.ageText(months: store.chronologicalAgeMonths(), language: language))
                LabeledContent(L10n.forMilestones(language), value: AgeFormatter.ageText(months: store.effectiveAgeMonths(), language: language))
                if store.profile.wasPreterm {
                    Text(L10n.correctedHelp(language))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }

            Section {
                Button {
                    let newProfile = BabyProfile(
                        id: UUID(), name: "", birthDate: Date(),
                        gestationalAgeWeeks: 40, useCorrectedAge: true
                    )
                    store.addProfile(newProfile)
                } label: {
                    Label(L10n.addChild(language), systemImage: "plus.circle")
                }

                Button {
                    showingExport = true
                } label: {
                    Label(L10n.exportForDoctor(language), systemImage: "square.and.arrow.up")
                }
            }

            Section {
                Button(role: .destructive) {
                    store.resetDemoData()
                } label: {
                    Label(L10n.resetMarks(language), systemImage: "trash")
                }
            }
        }
        .navigationTitle(L10n.tabProfile(language))
        .sheet(isPresented: $showingExport) {
            let text = store.exportSummary()
            ShareSheet(items: [text])
        }
    }
}

private struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

private struct MilestoneRow: View {
    let milestone: Milestone
    let status: MilestoneStatus
    let language: AppLanguage
    let compact: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            DomainIcon(domain: milestone.domain, size: compact ? 42 : 48)

            VStack(alignment: .leading, spacing: 6) {
                Text(milestone.title.text(language))
                    .font(compact ? .subheadline.weight(.semibold) : .body.weight(.semibold))
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                HStack(spacing: 8) {
                    Text(milestone.domain.title(language))
                    Text(L10n.byAge(AgeFormatter.dueText(month: milestone.dueMonth, language: language), language: language))
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer(minLength: 8)
            StatusIcon(status: status, language: language)
        }
        .padding(compact ? 16 : 10)
        .background {
            if compact {
                RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                    .fill(Theme.surface)
                    .shadow(color: Theme.cardShadow, radius: 8, x: 0, y: 3)
            }
        }
    }
}

private struct DomainIcon: View {
    let domain: DevelopmentDomain
    let size: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.28, style: .continuous)
                .fill(domain.tint.opacity(0.18))
            Image(systemName: domain.symbolName)
                .font(.system(size: size * 0.40, weight: .semibold))
                .foregroundStyle(domain.tint)
        }
        .frame(width: size, height: size)
    }
}

private struct StatusIcon: View {
    let status: MilestoneStatus
    let language: AppLanguage

    var body: some View {
        Image(systemName: status.symbolName)
            .foregroundStyle(status.tint)
            .font(.title3)
            .accessibilityLabel(status.title(language))
    }
}

private struct StatusPill: View {
    let status: MilestoneStatus
    let language: AppLanguage

    var body: some View {
        Label(status.title(language), systemImage: status.symbolName)
            .font(.subheadline.weight(.semibold))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(status.tint.opacity(0.15), in: Capsule())
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
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Theme.primary : Color(.tertiarySystemGroupedBackground), in: Capsule())
                .foregroundStyle(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.35, dampingFraction: 0.75), value: isSelected)
    }
}

private struct MetricTile: View {
    let title: String
    let value: String
    let symbol: String
    let tint: Color

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(tint.opacity(0.12))
                    .frame(width: 48, height: 48)
                Image(systemName: symbol)
                    .foregroundStyle(tint)
                    .font(.system(size: 22, weight: .semibold))
            }
            VStack(spacing: 4) {
                Text(value)
                    .font(.title2.bold())
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Text(title)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .padding(.horizontal, 12)
        .background {
            RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                .fill(Theme.surface)
                .shadow(color: Theme.cardShadow, radius: 8, x: 0, y: 4)
        }
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
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: title, symbol: symbol)
            Text(text)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                .fill(Theme.surface)
                .shadow(color: Theme.cardShadow, radius: 6, x: 0, y: 2)
        }
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
    let language: AppLanguage

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(Theme.primary.opacity(0.12))
                    .frame(width: 36, height: 36)
                Image(systemName: "cross.case")
                    .foregroundStyle(Theme.primary)
                    .font(.system(size: 16, weight: .semibold))
            }
            Text(L10n.evidenceNotice(language))
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                .fill(Theme.surface)
                .shadow(color: Theme.cardShadow, radius: 6, x: 0, y: 2)
        }
    }
}
