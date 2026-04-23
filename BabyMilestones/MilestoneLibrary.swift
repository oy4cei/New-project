import Foundation

enum MilestoneLibrary {
    static let sources: [SourceReference] = [
        SourceReference(
            id: "cdc-milestones",
            title: "Developmental Milestones",
            organization: "CDC Learn the Signs. Act Early.",
            url: "https://www.cdc.gov/act-early/milestones/index.html",
            note: "Чек-листы CDC используют навыки, которые обычно есть у 75% или более детей к возрасту."
        ),
        SourceReference(
            id: "aap-screening",
            title: "Surveillance/Monitoring and Screening",
            organization: "American Academy of Pediatrics",
            url: "https://www.aap.org/en/patient-care/screening-technical-assistance-and-resource-center/surveillancemonitoring-and-screening/",
            note: "AAP рекомендует наблюдение развития на профилактических визитах и стандартизированный скрининг в ключевые сроки."
        ),
        SourceReference(
            id: "who-motor",
            title: "WHO Motor Development Study",
            organization: "World Health Organization / Acta Paediatrica",
            url: "https://doi.org/10.1080/08035320500495563",
            note: "Окна достижения шести крупных моторных навыков описывают нормальную вариативность среди здоровых детей."
        ),
        SourceReference(
            id: "who-feeding",
            title: "Complementary feeding",
            organization: "World Health Organization",
            url: "https://www.who.int/health-topics/complementary-feeding",
            note: "WHO рекомендует начинать прикорм примерно в 6 месяцев, продолжая грудное молоко или смесь."
        ),
        SourceReference(
            id: "healthychildren-preterm",
            title: "Corrected Age For Preemies",
            organization: "HealthyChildren.org / AAP",
            url: "https://www.healthychildren.org/English/ages-stages/baby/preemie/Pages/Corrected-Age-For-Preemies.aspx",
            note: "Для недоношенных детей в первые 2 года полезно смотреть развитие по скорректированному возрасту."
        )
    ]

    static let milestones: [Milestone] = [
        Milestone(
            id: "head-up-tummy-2m",
            title: "Приподнимает голову лежа на животе",
            domain: .motor,
            dueMonth: 2,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Контроль головы созревает постепенно: сначала короткие подъемы на животе, затем устойчивое удержание.",
            actionNote: "Если после контрольного возраста голова совсем не поднимается или движения заметно асимметричны, обсудите это с педиатром.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "social-smile-2m",
            title: "Улыбается в ответ на лицо или голос",
            domain: .social,
            dueMonth: 2,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Социальная улыбка - ранний маркер контакта и ответа на взрослого.",
            actionNote: "Отсутствие ответной улыбки вместе с плохим зрительным контактом стоит обсудить на ближайшем визите.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "steady-head-4m",
            title: "Держит голову без поддержки на руках у взрослого",
            domain: .motor,
            dueMonth: 4,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "CDC относит устойчивое удержание головы без поддержки к важным навыкам 4 месяцев.",
            actionNote: "Если голова все еще сильно запрокидывается или ребенок мало двигает одной стороной тела, лучше не ждать планового осмотра.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "cooing-4m",
            title: "Гулит и отвечает звуками на речь",
            domain: .communication,
            dueMonth: 4,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Ранние звуки и очередность в общении поддерживают дальнейшее развитие речи.",
            actionNote: "Если ребенок не реагирует на голос или громкие звуки, стоит обсудить слух и развитие.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "rolls-tummy-back-6m",
            title: "Переворачивается с живота на спину",
            domain: .motor,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Переворот обычно появляется вместе с усилением мышц плечевого пояса и корпуса.",
            actionNote: "Если ребенок не пытается менять положение, мало опирается на руки или есть выраженный тонус, обсудите это с врачом.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "sits-supported-hands-6m",
            title: "Сидит с опорой на руки",
            domain: .motor,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Это переходный навык перед самостоятельным сидением.",
            actionNote: "Не высаживайте насильно. Если нет контроля головы и корпуса, обсудите двигательную поддержку.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "complementary-feeding-6m",
            title: "Начало прикорма примерно в 6 месяцев",
            domain: .feeding,
            dueMonth: 6,
            expectedWindow: 6...6,
            evidence: .whoGuideline,
            sources: ["who-feeding"],
            clinicalNote: "WHO описывает прикорм как пищу в дополнение к грудному молоку или смеси, когда одного молока уже недостаточно.",
            actionNote: "Начинайте с безопасной текстуры и учитывайте готовность: контроль головы, интерес к еде, возможность сидеть с поддержкой. При недоношенности согласуйте срок с врачом.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "laughs-6m",
            title: "Смеется и вовлекается в игру лицом к лицу",
            domain: .social,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Ответный смех и обмен звуками отражают социальное внимание.",
            actionNote: "Если ребенок редко реагирует на людей или потерял контакт, стоит обсудить это вне очереди.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "responds-name-9m",
            title: "Оглядывается на свое имя",
            domain: .social,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Реакция на имя - важный ранний навык совместного внимания.",
            actionNote: "Если ребенок не реагирует на имя и звуки, обсудите слух и развитие коммуникации.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "sits-without-support-9m",
            title: "Сидит без поддержки",
            domain: .motor,
            dueMonth: 9,
            expectedWindow: 3.8...9.2,
            evidence: .whoWindow,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: "В исследовании WHO окно самостоятельного сидения у здоровых детей было примерно 3.8-9.2 месяца.",
            actionNote: "Если ближе к 9 месяцам ребенок не сидит без поддержки или теряет уже освоенный навык, обсудите это с врачом.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "object-permanence-9m",
            title: "Ищет упавший или спрятанный предмет",
            domain: .cognition,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Поиск предмета показывает развитие внимания, памяти и причинно-следственных связей.",
            actionNote: "Если вместе с этим мало зрительного контакта или игры, отметьте примеры для педиатра.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "rakes-food-9m",
            title: "Подгребает еду пальцами к себе",
            domain: .feeding,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-feeding"],
            clinicalNote: "Самостоятельное касание еды помогает развивать сенсорный опыт и мелкую моторику.",
            actionNote: "Следите за безопасной формой еды и рисками удушья. Если ребенок совсем не интересуется едой, обсудите кормление.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "crawls-hands-knees",
            title: "Ползает на четвереньках или уверенно перемещается к цели",
            domain: .motor,
            dueMonth: 13.5,
            expectedWindow: 5.2...13.5,
            evidence: .whoWindow,
            sources: ["who-motor"],
            clinicalNote: "WHO описывает окно ползания на руках и коленях 5.2-13.5 месяца, но часть здоровых детей пропускает именно этот вариант ползания.",
            actionNote: "Важнее общий прогресс: перевороты, сидение, попытки достать предмет, симметрия движений. Отсутствие любого перемещения стоит обсудить.",
            isFlexibleVariant: true
        ),
        Milestone(
            id: "pincer-12m",
            title: "Берет маленькие кусочки большим и указательным пальцем",
            domain: .motor,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Пинцетный захват нужен для еды руками и точных действий с предметами.",
            actionNote: "Если одна рука почти не используется или хват очень слабый, обсудите это с врачом.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "pulls-to-stand-12m",
            title: "Подтягивается, чтобы встать",
            domain: .motor,
            dueMonth: 12,
            expectedWindow: 4.8...11.4,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: "CDC относит подтягивание в стойку к навыкам 1 года; WHO дает широкое окно стояния с помощью.",
            actionNote: "Если ребенок не переносит вес на ноги или есть выраженная асимметрия, обсудите это с педиатром.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "cruises-12m",
            title: "Ходит вдоль мебели, держась руками",
            domain: .motor,
            dueMonth: 12,
            expectedWindow: 5.9...13.7,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: "Ходьба с опорой обычно предшествует самостоятельным шагам.",
            actionNote: "Используйте устойчивую мебель и избегайте ходунков. При отсутствии прогресса после года обсудите с врачом.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "waves-bye-12m",
            title: "Машет пока-пока",
            domain: .communication,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Жесты - часть ранней коммуникации до активной речи.",
            actionNote: "Если нет жестов, реакции на имя или интереса к общению, это повод для раннего обсуждения.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "mama-dada-12m",
            title: "Называет родителя мама, папа или своим словом",
            domain: .communication,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Первые осмысленные слова часто появляются вокруг первого года, но пассивная речь обычно богаче активной.",
            actionNote: "Если нет лепета, жестов или реакции на речь, обсудите слух и коммуникацию.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "points-ask-15m",
            title: "Показывает пальцем, чтобы попросить помощь или предмет",
            domain: .communication,
            dueMonth: 15,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Указательный жест помогает ребенку разделять внимание со взрослым.",
            actionNote: "Отсутствие указательного жеста вместе с задержкой речи стоит обсудить и не откладывать скрининг.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "first-independent-steps-15m",
            title: "Делает несколько самостоятельных шагов",
            domain: .motor,
            dueMonth: 15,
            expectedWindow: 8.2...17.6,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: "CDC относит несколько самостоятельных шагов к 15 месяцам; WHO показывает широкое окно ходьбы без опоры.",
            actionNote: "Если к 15 месяцам нет шагов, а к 18 нет ходьбы без опоры, нужна очная оценка.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "one-two-words-15m",
            title: "Пробует сказать 1-2 слова кроме мама/папа",
            domain: .communication,
            dueMonth: 15,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Слова могут быть упрощенными, если они устойчиво обозначают один и тот же предмет или действие.",
            actionNote: "Если ребенок не пытается имитировать звуки и слова, обсудите слух и речевое развитие.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "walks-alone-18m",
            title: "Ходит без поддержки",
            domain: .motor,
            dueMonth: 18,
            expectedWindow: 8.2...17.6,
            evidence: .whoWindow,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: "В исследовании WHO верхняя граница окна самостоятельной ходьбы была около 17.6 месяца.",
            actionNote: "Если к 18 месяцам ребенок не ходит без поддержки, это повод для очной оценки.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "three-words-18m",
            title: "Пробует сказать 3 или больше слов кроме мама/папа",
            domain: .communication,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Для 18 месяцев CDC ожидает несколько слов и понимание простых инструкций.",
            actionNote: "Если слов нет или ребенок потерял слова, обсудите это быстро и попросите скрининг развития.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "points-show-18m",
            title: "Показывает пальцем что-то интересное",
            domain: .social,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "Показ интересного предмета - маркер совместного внимания.",
            actionNote: "Если нет совместного внимания, жестов или контакта, обсудите скрининг аутизма и развитие коммуникации.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "spoon-18m",
            title: "Пробует есть ложкой",
            domain: .feeding,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-feeding"],
            clinicalNote: "Навык еды ложкой развивается вместе с мелкой моторикой и самостоятельностью.",
            actionNote: "Если ребенок давится обычными безопасными текстурами или резко ограничивает рацион, обсудите кормление.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "two-word-phrases-24m",
            title: "Соединяет два слова, например еще молока",
            domain: .communication,
            dueMonth: 24,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: "К двум годам важен не только словарь, но и появление простых фраз.",
            actionNote: "Если нет двухсловных фраз, попросите стандартизированный скрининг и оценку слуха.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-9m",
            title: "Стандартизированный скрининг развития",
            domain: .screening,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening", "cdc-milestones"],
            clinicalNote: "AAP рекомендует общий скрининг развития в 9, 18 и 30 месяцев.",
            actionNote: "Спросите, какой валидированный инструмент использует врач, особенно если есть недоношенность или низкая масса при рождении.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-18m",
            title: "Скрининг развития и аутизма",
            domain: .screening,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening", "cdc-milestones"],
            clinicalNote: "AAP рекомендует общий скрининг в 18 месяцев и ASD-скрининг в 18 и 24 месяца.",
            actionNote: "Если есть тревоги по речи, жестам или совместному вниманию, направление на помощь не нужно откладывать до диагноза.",
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-asd-24m",
            title: "Повторный ASD-скрининг",
            domain: .screening,
            dueMonth: 24,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening"],
            clinicalNote: "Повторный скрининг аутизма в 24 месяца помогает выявить детей, чьи признаки стали заметнее позже.",
            actionNote: "Попросите скрининг вне графика, если ребенок потерял навыки, не использует жесты или не откликается на имя.",
            isFlexibleVariant: false
        )
    ].sorted { left, right in
        if left.dueMonth == right.dueMonth {
            return left.title < right.title
        }
        return left.dueMonth < right.dueMonth
    }

    static func source(for id: String) -> SourceReference? {
        sources.first { $0.id == id }
    }
}
