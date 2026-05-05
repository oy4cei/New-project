import Foundation

enum MilestoneLibrary {
    private static func copy(ru: String, uk: String, en: String) -> LocalizedCopy {
        LocalizedCopy(ru: ru, uk: uk, en: en)
    }

    static let sources: [SourceReference] = [
        SourceReference(
            id: "cdc-milestones",
            title: copy(
                ru: "Этапы развития",
                uk: "Етапи розвитку",
                en: "Developmental Milestones"
            ),
            organization: copy(
                ru: "CDC Learn the Signs. Act Early.",
                uk: "CDC Learn the Signs. Act Early.",
                en: "CDC Learn the Signs. Act Early."
            ),
            url: "https://www.cdc.gov/act-early/milestones/index.html",
            note: copy(
                ru: "Чек-листы CDC используют навыки, которые обычно есть у 75% или более детей к возрасту.",
                uk: "Чек-листи CDC використовують навички, які зазвичай мають 75% або більше дітей до вказаного віку.",
                en: "CDC checklists use skills that 75% or more children usually have by the listed age."
            )
        ),
        SourceReference(
            id: "aap-screening",
            title: copy(
                ru: "Наблюдение и скрининг",
                uk: "Спостереження та скринінг",
                en: "Surveillance/Monitoring and Screening"
            ),
            organization: copy(
                ru: "Американская академия педиатрии",
                uk: "Американська академія педіатрії",
                en: "American Academy of Pediatrics"
            ),
            url: "https://www.aap.org/en/patient-care/screening-technical-assistance-and-resource-center/surveillancemonitoring-and-screening/",
            note: copy(
                ru: "AAP рекомендует наблюдение развития на профилактических визитах и стандартизированный скрининг в ключевые сроки.",
                uk: "AAP рекомендує спостереження за розвитком на профілактичних візитах і стандартизований скринінг у ключові строки.",
                en: "AAP recommends developmental surveillance at preventive visits and standardized screening at key ages."
            )
        ),
        SourceReference(
            id: "who-motor",
            title: copy(
                ru: "Исследование WHO моторного развития",
                uk: "Дослідження WHO моторного розвитку",
                en: "WHO Motor Development Study"
            ),
            organization: copy(
                ru: "Всемирная организация здравоохранения / Acta Paediatrica",
                uk: "Всесвітня організація охорони здоров'я / Acta Paediatrica",
                en: "World Health Organization / Acta Paediatrica"
            ),
            url: "https://doi.org/10.1080/08035320500495563",
            note: copy(
                ru: "Окна достижения шести крупных моторных навыков описывают нормальную вариативность среди здоровых детей.",
                uk: "Вікна досягнення шести великих моторних навичок описують нормальну варіативність серед здорових дітей.",
                en: "The windows for six gross motor milestones describe normal variation among healthy children."
            )
        ),
        SourceReference(
            id: "who-feeding",
            title: copy(
                ru: "Прикорм",
                uk: "Прикорм",
                en: "Complementary feeding"
            ),
            organization: copy(
                ru: "Всемирная организация здравоохранения",
                uk: "Всесвітня організація охорони здоров'я",
                en: "World Health Organization"
            ),
            url: "https://www.who.int/health-topics/complementary-feeding",
            note: copy(
                ru: "WHO рекомендует начинать прикорм примерно в 6 месяцев, продолжая грудное молоко или смесь.",
                uk: "WHO рекомендує починати прикорм приблизно у 6 місяців, продовжуючи грудне молоко або суміш.",
                en: "WHO recommends starting complementary foods at about 6 months while continuing breast milk or formula."
            )
        ),
        SourceReference(
            id: "healthychildren-preterm",
            title: copy(
                ru: "Скорректированный возраст недоношенных детей",
                uk: "Скоригований вік недоношених дітей",
                en: "Corrected Age For Preemies"
            ),
            organization: copy(
                ru: "HealthyChildren.org / AAP",
                uk: "HealthyChildren.org / AAP",
                en: "HealthyChildren.org / AAP"
            ),
            url: "https://www.healthychildren.org/English/ages-stages/baby/preemie/Pages/Corrected-Age-For-Preemies.aspx",
            note: copy(
                ru: "Для недоношенных детей в первые 2 года полезно смотреть развитие по скорректированному возрасту.",
                uk: "Для недоношених дітей у перші 2 роки корисно оцінювати розвиток за скоригованим віком.",
                en: "For preterm children, corrected age is useful for tracking development during the first 2 years."
            )
        )
    ]

    static let milestones: [Milestone] = [
        Milestone(
            id: "head-up-tummy-2m",
            title: copy(
                ru: "Приподнимает голову лежа на животе",
                uk: "Підіймає голову лежачи на животі",
                en: "Lifts head while on tummy"
            ),
            domain: .motor,
            dueMonth: 2,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Контроль головы созревает постепенно: сначала короткие подъемы на животе, затем устойчивое удержание.",
                uk: "Контроль голови дозріває поступово: спочатку короткі підйоми на животі, потім стійке утримання.",
                en: "Head control matures gradually: brief lifts on the tummy come first, then steadier control."
            ),
            actionNote: copy(
                ru: "Если после контрольного возраста голова совсем не поднимается или движения заметно асимметричны, обсудите это с педиатром.",
                uk: "Якщо після контрольного віку голова зовсім не підіймається або рухи помітно асиметричні, обговоріть це з педіатром.",
                en: "If the head does not lift at all after the checkpoint age, or movement looks clearly asymmetric, discuss it with a pediatrician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "social-smile-2m",
            title: copy(
                ru: "Улыбается в ответ на лицо или голос",
                uk: "Усміхається у відповідь на обличчя або голос",
                en: "Smiles back at a face or voice"
            ),
            domain: .social,
            dueMonth: 2,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Социальная улыбка - ранний маркер контакта и ответа на взрослого.",
                uk: "Соціальна усмішка - ранній маркер контакту та відповіді на дорослого.",
                en: "A social smile is an early sign of connection and response to a caregiver."
            ),
            actionNote: copy(
                ru: "Отсутствие ответной улыбки вместе с плохим зрительным контактом стоит обсудить на ближайшем визите.",
                uk: "Відсутність відповідної усмішки разом із слабким зоровим контактом варто обговорити на найближчому візиті.",
                en: "If there is no responsive smile together with limited eye contact, bring it up at the next visit."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "steady-head-4m",
            title: copy(
                ru: "Держит голову без поддержки на руках у взрослого",
                uk: "Тримає голову без підтримки на руках у дорослого",
                en: "Holds head steady when held"
            ),
            domain: .motor,
            dueMonth: 4,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "CDC относит устойчивое удержание головы без поддержки к важным навыкам 4 месяцев.",
                uk: "CDC відносить стійке утримання голови без підтримки до важливих навичок 4 місяців.",
                en: "CDC lists steady head control without support as an important 4-month skill."
            ),
            actionNote: copy(
                ru: "Если голова все еще сильно запрокидывается или ребенок мало двигает одной стороной тела, лучше не ждать планового осмотра.",
                uk: "Якщо голова все ще сильно закидається або дитина мало рухає однією стороною тіла, краще не чекати планового огляду.",
                en: "If the head still drops far back or one side of the body moves much less, do not wait for the routine visit."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "cooing-4m",
            title: copy(
                ru: "Гулит и отвечает звуками на речь",
                uk: "Гулить і відповідає звуками на мовлення",
                en: "Coos and answers speech with sounds"
            ),
            domain: .communication,
            dueMonth: 4,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Ранние звуки и очередность в общении поддерживают дальнейшее развитие речи.",
                uk: "Ранні звуки та черговість у спілкуванні підтримують подальший розвиток мовлення.",
                en: "Early sounds and back-and-forth interaction support later speech development."
            ),
            actionNote: copy(
                ru: "Если ребенок не реагирует на голос или громкие звуки, стоит обсудить слух и развитие.",
                uk: "Якщо дитина не реагує на голос або гучні звуки, варто обговорити слух і розвиток.",
                en: "If the child does not react to voices or loud sounds, discuss hearing and development."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "rolls-tummy-back-6m",
            title: copy(
                ru: "Переворачивается с живота на спину",
                uk: "Перевертається з живота на спину",
                en: "Rolls from tummy to back"
            ),
            domain: .motor,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Переворот обычно появляется вместе с усилением мышц плечевого пояса и корпуса.",
                uk: "Перевертання зазвичай з'являється разом зі зміцненням м'язів плечового поясу та корпусу.",
                en: "Rolling usually appears as shoulder and trunk strength improves."
            ),
            actionNote: copy(
                ru: "Если ребенок не пытается менять положение, мало опирается на руки или есть выраженный тонус, обсудите это с врачом.",
                uk: "Якщо дитина не намагається змінювати положення, мало спирається на руки або є виражений тонус, обговоріть це з лікарем.",
                en: "If the child does not try to change position, barely pushes on the arms, or has marked muscle tone, discuss it with a clinician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "sits-supported-hands-6m",
            title: copy(
                ru: "Сидит с опорой на руки",
                uk: "Сидить з опорою на руки",
                en: "Sits leaning on hands"
            ),
            domain: .motor,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Это переходный навык перед самостоятельным сидением.",
                uk: "Це перехідна навичка перед самостійним сидінням.",
                en: "This is a transitional skill before independent sitting."
            ),
            actionNote: copy(
                ru: "Не высаживайте насильно. Если нет контроля головы и корпуса, обсудите двигательную поддержку.",
                uk: "Не саджайте насильно. Якщо немає контролю голови та корпусу, обговоріть рухову підтримку.",
                en: "Do not force sitting. If head and trunk control are absent, ask about motor support."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "complementary-feeding-6m",
            title: copy(
                ru: "Начало прикорма примерно в 6 месяцев",
                uk: "Початок прикорму приблизно у 6 місяців",
                en: "Starts complementary foods around 6 months"
            ),
            domain: .feeding,
            dueMonth: 6,
            expectedWindow: 6...6,
            evidence: .whoGuideline,
            sources: ["who-feeding"],
            clinicalNote: copy(
                ru: "WHO описывает прикорм как пищу в дополнение к грудному молоку или смеси, когда одного молока уже недостаточно.",
                uk: "WHO описує прикорм як їжу на додачу до грудного молока або суміші, коли лише молока вже недостатньо.",
                en: "WHO describes complementary feeding as foods added to breast milk or formula when milk alone is no longer enough."
            ),
            actionNote: copy(
                ru: "Начинайте с безопасной текстуры и учитывайте готовность: контроль головы, интерес к еде, возможность сидеть с поддержкой. При недоношенности согласуйте срок с врачом.",
                uk: "Починайте з безпечної текстури та враховуйте готовність: контроль голови, інтерес до їжі, можливість сидіти з підтримкою. При недоношеності узгодьте строк із лікарем.",
                en: "Start with safe textures and readiness cues: head control, interest in food, and sitting with support. For preterm babies, confirm timing with the clinician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "laughs-6m",
            title: copy(
                ru: "Смеется и вовлекается в игру лицом к лицу",
                uk: "Сміється і залучається до гри обличчям до обличчя",
                en: "Laughs and engages in face-to-face play"
            ),
            domain: .social,
            dueMonth: 6,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Ответный смех и обмен звуками отражают социальное внимание.",
                uk: "Відповідний сміх та обмін звуками відображають соціальну увагу.",
                en: "Responsive laughter and sound exchange reflect social attention."
            ),
            actionNote: copy(
                ru: "Если ребенок редко реагирует на людей или потерял контакт, стоит обсудить это вне очереди.",
                uk: "Якщо дитина рідко реагує на людей або втратила контакт, варто обговорити це поза чергою.",
                en: "If the child rarely responds to people or has lost social connection, discuss it promptly."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "responds-name-9m",
            title: copy(
                ru: "Оглядывается на свое имя",
                uk: "Озирається на своє ім'я",
                en: "Looks when called by name"
            ),
            domain: .social,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Реакция на имя - важный ранний навык совместного внимания.",
                uk: "Реакція на ім'я - важлива рання навичка спільної уваги.",
                en: "Responding to name is an important early joint-attention skill."
            ),
            actionNote: copy(
                ru: "Если ребенок не реагирует на имя и звуки, обсудите слух и развитие коммуникации.",
                uk: "Якщо дитина не реагує на ім'я та звуки, обговоріть слух і розвиток комунікації.",
                en: "If the child does not respond to name and sounds, discuss hearing and communication development."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "sits-without-support-9m",
            title: copy(
                ru: "Сидит без поддержки",
                uk: "Сидить без підтримки",
                en: "Sits without support"
            ),
            domain: .motor,
            dueMonth: 9,
            expectedWindow: 3.8...9.2,
            evidence: .whoWindow,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: copy(
                ru: "В исследовании WHO окно самостоятельного сидения у здоровых детей было примерно 3.8-9.2 месяца.",
                uk: "У дослідженні WHO вікно самостійного сидіння у здорових дітей становило приблизно 3.8-9.2 місяця.",
                en: "In the WHO study, the window for independent sitting among healthy children was about 3.8-9.2 months."
            ),
            actionNote: copy(
                ru: "Если ближе к 9 месяцам ребенок не сидит без поддержки или теряет уже освоенный навык, обсудите это с врачом.",
                uk: "Якщо ближче до 9 місяців дитина не сидить без підтримки або втрачає вже освоєну навичку, обговоріть це з лікарем.",
                en: "If close to 9 months the child cannot sit without support or loses a skill, discuss it with a clinician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "object-permanence-9m",
            title: copy(
                ru: "Ищет упавший или спрятанный предмет",
                uk: "Шукає предмет, що впав або був схований",
                en: "Looks for a dropped or hidden object"
            ),
            domain: .cognition,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Поиск предмета показывает развитие внимания, памяти и причинно-следственных связей.",
                uk: "Пошук предмета показує розвиток уваги, пам'яті та причинно-наслідкових зв'язків.",
                en: "Looking for an object reflects attention, memory, and cause-and-effect learning."
            ),
            actionNote: copy(
                ru: "Если вместе с этим мало зрительного контакта или игры, отметьте примеры для педиатра.",
                uk: "Якщо разом із цим мало зорового контакту або гри, занотуйте приклади для педіатра.",
                en: "If this comes with limited eye contact or play, note examples for the pediatrician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "rakes-food-9m",
            title: copy(
                ru: "Подгребает еду пальцами к себе",
                uk: "Підгортає їжу пальцями до себе",
                en: "Rakes food toward self with fingers"
            ),
            domain: .feeding,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-feeding"],
            clinicalNote: copy(
                ru: "Самостоятельное касание еды помогает развивать сенсорный опыт и мелкую моторику.",
                uk: "Самостійне торкання їжі допомагає розвивати сенсорний досвід і дрібну моторику.",
                en: "Touching food independently supports sensory experience and fine motor skills."
            ),
            actionNote: copy(
                ru: "Следите за безопасной формой еды и рисками удушья. Если ребенок совсем не интересуется едой, обсудите кормление.",
                uk: "Стежте за безпечною формою їжі та ризиками вдавлення. Якщо дитина зовсім не цікавиться їжею, обговоріть годування.",
                en: "Use safe food shapes and watch choking risks. If the child has no interest in food, discuss feeding."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "crawls-hands-knees",
            title: copy(
                ru: "Ползает на четвереньках или уверенно перемещается к цели",
                uk: "Повзає рачки або впевнено рухається до цілі",
                en: "Crawls on hands and knees or moves purposefully"
            ),
            domain: .motor,
            dueMonth: 13.5,
            expectedWindow: 5.2...13.5,
            evidence: .whoWindow,
            sources: ["who-motor"],
            clinicalNote: copy(
                ru: "WHO описывает окно ползания на руках и коленях 5.2-13.5 месяца, но часть здоровых детей пропускает именно этот вариант ползания.",
                uk: "WHO описує вікно повзання на руках і колінах 5.2-13.5 місяця, але частина здорових дітей пропускає саме цей варіант повзання.",
                en: "WHO describes a 5.2-13.5 month window for hands-and-knees crawling, but some healthy children skip this exact crawling pattern."
            ),
            actionNote: copy(
                ru: "Важнее общий прогресс: перевороты, сидение, попытки достать предмет, симметрия движений. Отсутствие любого перемещения стоит обсудить.",
                uk: "Важливіший загальний прогрес: перевертання, сидіння, спроби дістати предмет, симетрія рухів. Відсутність будь-якого переміщення варто обговорити.",
                en: "Overall progress matters more: rolling, sitting, reaching, and movement symmetry. No purposeful mobility is worth discussing."
            ),
            isFlexibleVariant: true
        ),
        Milestone(
            id: "pincer-12m",
            title: copy(
                ru: "Берет маленькие кусочки большим и указательным пальцем",
                uk: "Бере маленькі шматочки великим і вказівним пальцями",
                en: "Picks up small pieces with thumb and pointer finger"
            ),
            domain: .motor,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Пинцетный захват нужен для еды руками и точных действий с предметами.",
                uk: "Пінцетний захват потрібен для їжі руками та точних дій із предметами.",
                en: "The pincer grasp supports finger feeding and precise object handling."
            ),
            actionNote: copy(
                ru: "Если одна рука почти не используется или хват очень слабый, обсудите это с врачом.",
                uk: "Якщо одна рука майже не використовується або захват дуже слабкий, обговоріть це з лікарем.",
                en: "If one hand is rarely used or the grasp is very weak, discuss it with a clinician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "pulls-to-stand-12m",
            title: copy(
                ru: "Подтягивается, чтобы встать",
                uk: "Підтягується, щоб встати",
                en: "Pulls up to stand"
            ),
            domain: .motor,
            dueMonth: 12,
            expectedWindow: 4.8...11.4,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: copy(
                ru: "CDC относит подтягивание в стойку к навыкам 1 года; WHO дает широкое окно стояния с помощью.",
                uk: "CDC відносить підтягування до стояння до навичок 1 року; WHO дає широке вікно стояння з допомогою.",
                en: "CDC lists pulling to stand as a 1-year skill; WHO gives a broad window for standing with assistance."
            ),
            actionNote: copy(
                ru: "Если ребенок не переносит вес на ноги или есть выраженная асимметрия, обсудите это с педиатром.",
                uk: "Якщо дитина не переносить вагу на ноги або є виражена асиметрія, обговоріть це з педіатром.",
                en: "If the child does not bear weight on the legs or has marked asymmetry, discuss it with the pediatrician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "cruises-12m",
            title: copy(
                ru: "Ходит вдоль мебели, держась руками",
                uk: "Ходить уздовж меблів, тримаючись руками",
                en: "Cruises along furniture while holding on"
            ),
            domain: .motor,
            dueMonth: 12,
            expectedWindow: 5.9...13.7,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: copy(
                ru: "Ходьба с опорой обычно предшествует самостоятельным шагам.",
                uk: "Ходьба з опорою зазвичай передує самостійним крокам.",
                en: "Supported walking usually comes before independent steps."
            ),
            actionNote: copy(
                ru: "Используйте устойчивую мебель и избегайте ходунков. При отсутствии прогресса после года обсудите с врачом.",
                uk: "Використовуйте стійкі меблі та уникайте ходунків. За відсутності прогресу після року обговоріть це з лікарем.",
                en: "Use stable furniture and avoid baby walkers. If progress stalls after 1 year, discuss it with a clinician."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "waves-bye-12m",
            title: copy(
                ru: "Машет пока-пока",
                uk: "Махає бувай-бувай",
                en: "Waves bye-bye"
            ),
            domain: .communication,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Жесты - часть ранней коммуникации до активной речи.",
                uk: "Жести - частина ранньої комунікації до активного мовлення.",
                en: "Gestures are part of early communication before active speech."
            ),
            actionNote: copy(
                ru: "Если нет жестов, реакции на имя или интереса к общению, это повод для раннего обсуждения.",
                uk: "Якщо немає жестів, реакції на ім'я або інтересу до спілкування, це привід для раннього обговорення.",
                en: "No gestures, name response, or interest in interaction is a reason for early discussion."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "mama-dada-12m",
            title: copy(
                ru: "Называет родителя мама, папа или своим словом",
                uk: "Називає одного з батьків мама, тато або своїм словом",
                en: "Calls a parent mama, dada, or another special name"
            ),
            domain: .communication,
            dueMonth: 12,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Первые осмысленные слова часто появляются вокруг первого года, но пассивная речь обычно богаче активной.",
                uk: "Перші осмислені слова часто з'являються близько першого року, але розуміння мови зазвичай багатше за активне мовлення.",
                en: "First meaningful words often appear around 1 year, while receptive language is usually richer than spoken language."
            ),
            actionNote: copy(
                ru: "Если нет лепета, жестов или реакции на речь, обсудите слух и коммуникацию.",
                uk: "Якщо немає лепету, жестів або реакції на мовлення, обговоріть слух і комунікацію.",
                en: "If there is no babbling, gestures, or response to speech, discuss hearing and communication."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "points-ask-15m",
            title: copy(
                ru: "Показывает пальцем, чтобы попросить помощь или предмет",
                uk: "Показує пальцем, щоб попросити допомогу або предмет",
                en: "Points to ask for help or an object"
            ),
            domain: .communication,
            dueMonth: 15,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Указательный жест помогает ребенку разделять внимание со взрослым.",
                uk: "Вказівний жест допомагає дитині розділяти увагу з дорослим.",
                en: "Pointing helps a child share attention with an adult."
            ),
            actionNote: copy(
                ru: "Отсутствие указательного жеста вместе с задержкой речи стоит обсудить и не откладывать скрининг.",
                uk: "Відсутність вказівного жесту разом із затримкою мовлення варто обговорити й не відкладати скринінг.",
                en: "No pointing together with delayed speech is worth discussing; do not delay screening."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "first-independent-steps-15m",
            title: copy(
                ru: "Делает несколько самостоятельных шагов",
                uk: "Робить кілька самостійних кроків",
                en: "Takes a few independent steps"
            ),
            domain: .motor,
            dueMonth: 15,
            expectedWindow: 8.2...17.6,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: copy(
                ru: "CDC относит несколько самостоятельных шагов к 15 месяцам; WHO показывает широкое окно ходьбы без опоры.",
                uk: "CDC відносить кілька самостійних кроків до 15 місяців; WHO показує широке вікно ходьби без опори.",
                en: "CDC places a few independent steps at 15 months; WHO shows a wide window for walking alone."
            ),
            actionNote: copy(
                ru: "Если к 15 месяцам нет шагов, а к 18 нет ходьбы без опоры, нужна очная оценка.",
                uk: "Якщо до 15 місяців немає кроків, а до 18 немає ходьби без опори, потрібна очна оцінка.",
                en: "If there are no steps by 15 months, and no unsupported walking by 18 months, an in-person evaluation is needed."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "one-two-words-15m",
            title: copy(
                ru: "Пробует сказать 1-2 слова кроме мама/папа",
                uk: "Пробує сказати 1-2 слова крім мама/тато",
                en: "Tries 1-2 words besides mama/dada"
            ),
            domain: .communication,
            dueMonth: 15,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Слова могут быть упрощенными, если они устойчиво обозначают один и тот же предмет или действие.",
                uk: "Слова можуть бути спрощеними, якщо вони стабільно позначають той самий предмет або дію.",
                en: "Words can be simplified if they consistently refer to the same object or action."
            ),
            actionNote: copy(
                ru: "Если ребенок не пытается имитировать звуки и слова, обсудите слух и речевое развитие.",
                uk: "Якщо дитина не намагається наслідувати звуки та слова, обговоріть слух і мовленнєвий розвиток.",
                en: "If the child does not try to imitate sounds or words, discuss hearing and speech development."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "walks-alone-18m",
            title: copy(
                ru: "Ходит без поддержки",
                uk: "Ходить без підтримки",
                en: "Walks without support"
            ),
            domain: .motor,
            dueMonth: 18,
            expectedWindow: 8.2...17.6,
            evidence: .whoWindow,
            sources: ["cdc-milestones", "who-motor"],
            clinicalNote: copy(
                ru: "В исследовании WHO верхняя граница окна самостоятельной ходьбы была около 17.6 месяца.",
                uk: "У дослідженні WHO верхня межа вікна самостійної ходьби була близько 17.6 місяця.",
                en: "In the WHO study, the upper end of the walking-alone window was about 17.6 months."
            ),
            actionNote: copy(
                ru: "Если к 18 месяцам ребенок не ходит без поддержки, это повод для очной оценки.",
                uk: "Якщо до 18 місяців дитина не ходить без підтримки, це привід для очної оцінки.",
                en: "If the child is not walking without support by 18 months, this warrants an in-person evaluation."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "three-words-18m",
            title: copy(
                ru: "Пробует сказать 3 или больше слов кроме мама/папа",
                uk: "Пробує сказати 3 або більше слів крім мама/тато",
                en: "Tries 3 or more words besides mama/dada"
            ),
            domain: .communication,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Для 18 месяцев CDC ожидает несколько слов и понимание простых инструкций.",
                uk: "Для 18 місяців CDC очікує кілька слів і розуміння простих інструкцій.",
                en: "For 18 months, CDC expects several words and understanding of simple directions."
            ),
            actionNote: copy(
                ru: "Если слов нет или ребенок потерял слова, обсудите это быстро и попросите скрининг развития.",
                uk: "Якщо слів немає або дитина втратила слова, обговоріть це швидко й попросіть скринінг розвитку.",
                en: "If there are no words or words were lost, discuss it promptly and ask for developmental screening."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "points-show-18m",
            title: copy(
                ru: "Показывает пальцем что-то интересное",
                uk: "Показує пальцем щось цікаве",
                en: "Points to show something interesting"
            ),
            domain: .social,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "Показ интересного предмета - маркер совместного внимания.",
                uk: "Показ цікавого предмета - маркер спільної уваги.",
                en: "Pointing to show something interesting is a marker of joint attention."
            ),
            actionNote: copy(
                ru: "Если нет совместного внимания, жестов или контакта, обсудите скрининг аутизма и развитие коммуникации.",
                uk: "Якщо немає спільної уваги, жестів або контакту, обговоріть скринінг аутизму та розвиток комунікації.",
                en: "If joint attention, gestures, or connection are absent, discuss autism screening and communication development."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "spoon-18m",
            title: copy(
                ru: "Пробует есть ложкой",
                uk: "Пробує їсти ложкою",
                en: "Tries to eat with a spoon"
            ),
            domain: .feeding,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones", "who-feeding"],
            clinicalNote: copy(
                ru: "Навык еды ложкой развивается вместе с мелкой моторикой и самостоятельностью.",
                uk: "Навичка їсти ложкою розвивається разом із дрібною моторикою та самостійністю.",
                en: "Spoon use develops alongside fine motor skills and independence."
            ),
            actionNote: copy(
                ru: "Если ребенок давится обычными безопасными текстурами или резко ограничивает рацион, обсудите кормление.",
                uk: "Якщо дитина давиться звичайними безпечними текстурами або різко обмежує раціон, обговоріть годування.",
                en: "If the child gags on typical safe textures or sharply restricts foods, discuss feeding."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "two-word-phrases-24m",
            title: copy(
                ru: "Соединяет два слова, например еще молока",
                uk: "Поєднує два слова, наприклад ще молока",
                en: "Combines two words, such as more milk"
            ),
            domain: .communication,
            dueMonth: 24,
            expectedWindow: nil,
            evidence: .cdc75,
            sources: ["cdc-milestones"],
            clinicalNote: copy(
                ru: "К двум годам важен не только словарь, но и появление простых фраз.",
                uk: "До двох років важливий не лише словник, а й поява простих фраз.",
                en: "By 2 years, simple phrases matter as much as vocabulary size."
            ),
            actionNote: copy(
                ru: "Если нет двухсловных фраз, попросите стандартизированный скрининг и оценку слуха.",
                uk: "Якщо немає фраз із двох слів, попросіть стандартизований скринінг і оцінку слуху.",
                en: "If there are no two-word phrases, ask for standardized screening and hearing evaluation."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-9m",
            title: copy(
                ru: "Стандартизированный скрининг развития",
                uk: "Стандартизований скринінг розвитку",
                en: "Standardized developmental screening"
            ),
            domain: .screening,
            dueMonth: 9,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening", "cdc-milestones"],
            clinicalNote: copy(
                ru: "AAP рекомендует общий скрининг развития в 9, 18 и 30 месяцев.",
                uk: "AAP рекомендує загальний скринінг розвитку у 9, 18 і 30 місяців.",
                en: "AAP recommends general developmental screening at 9, 18, and 30 months."
            ),
            actionNote: copy(
                ru: "Спросите, какой валидированный инструмент использует врач, особенно если есть недоношенность или низкая масса при рождении.",
                uk: "Запитайте, який валідований інструмент використовує лікар, особливо якщо є недоношеність або низька маса при народженні.",
                en: "Ask which validated tool the clinician uses, especially with prematurity or low birth weight."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-18m",
            title: copy(
                ru: "Скрининг развития и аутизма",
                uk: "Скринінг розвитку та аутизму",
                en: "Developmental and autism screening"
            ),
            domain: .screening,
            dueMonth: 18,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening", "cdc-milestones"],
            clinicalNote: copy(
                ru: "AAP рекомендует общий скрининг в 18 месяцев и ASD-скрининг в 18 и 24 месяца.",
                uk: "AAP рекомендує загальний скринінг у 18 місяців і ASD-скринінг у 18 та 24 місяці.",
                en: "AAP recommends general screening at 18 months and ASD screening at 18 and 24 months."
            ),
            actionNote: copy(
                ru: "Если есть тревоги по речи, жестам или совместному вниманию, направление на помощь не нужно откладывать до диагноза.",
                uk: "Якщо є тривоги щодо мовлення, жестів або спільної уваги, направлення по допомогу не потрібно відкладати до діагнозу.",
                en: "If speech, gestures, or joint attention are concerning, support should not wait for a diagnosis."
            ),
            isFlexibleVariant: false
        ),
        Milestone(
            id: "screening-asd-24m",
            title: copy(
                ru: "Повторный ASD-скрининг",
                uk: "Повторний ASD-скринінг",
                en: "Repeat ASD screening"
            ),
            domain: .screening,
            dueMonth: 24,
            expectedWindow: nil,
            evidence: .aapScreening,
            sources: ["aap-screening"],
            clinicalNote: copy(
                ru: "Повторный скрининг аутизма в 24 месяца помогает выявить детей, чьи признаки стали заметнее позже.",
                uk: "Повторний скринінг аутизму у 24 місяці допомагає виявити дітей, чиї ознаки стали помітнішими пізніше.",
                en: "Repeat autism screening at 24 months helps identify children whose signs become clearer later."
            ),
            actionNote: copy(
                ru: "Попросите скрининг вне графика, если ребенок потерял навыки, не использует жесты или не откликается на имя.",
                uk: "Попросіть скринінг поза графіком, якщо дитина втратила навички, не використовує жести або не відгукується на ім'я.",
                en: "Ask for screening outside the schedule if the child loses skills, does not use gestures, or does not respond to name."
            ),
            isFlexibleVariant: false
        ),
        // MARK: - 30 months
        Milestone(id: "two-word-sentences-30m", title: copy(ru: "Говорит фразами из 2+ слов, словарь ~50 слов", uk: "Говорить фразами з 2+ слів, словник ~50 слів", en: "Uses 2+ word phrases, ~50 word vocabulary"), domain: .communication, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "К 30 месяцам большинство детей строят короткие фразы и активно расширяют словарь.", uk: "До 30 місяців більшість дітей будують короткі фрази й активно розширюють словник.", en: "By 30 months most children form short phrases and rapidly expand vocabulary."), actionNote: copy(ru: "Если фраз нет или словарь очень мал, попросите оценку речи и слуха.", uk: "Якщо фраз немає або словник дуже малий, попросіть оцінку мовлення та слуху.", en: "If no phrases or very small vocabulary, request speech and hearing evaluation."), isFlexibleVariant: false),
        Milestone(id: "kicks-ball-30m", title: copy(ru: "Пинает мяч", uk: "Б'є м'яч ногою", en: "Kicks a ball"), domain: .motor, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Пинание мяча показывает координацию, баланс и силу ног.", uk: "Удар м'яча показує координацію, баланс і силу ніг.", en: "Kicking a ball shows coordination, balance, and leg strength."), actionNote: copy(ru: "Если ребенок не может стоять на одной ноге кратковременно или заметна асимметрия, обсудите с врачом.", uk: "Якщо дитина не може стояти на одній нозі короткочасно або помітна асиметрія, обговоріть із лікарем.", en: "If the child cannot briefly stand on one foot or asymmetry is noticeable, discuss with a clinician."), isFlexibleVariant: false),
        Milestone(id: "runs-30m", title: copy(ru: "Бегает", uk: "Бігає", en: "Runs"), domain: .motor, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Бег — следующий этап после уверенной ходьбы, требует координации и баланса.", uk: "Біг — наступний етап після впевненої ходьби, потребує координації та балансу.", en: "Running is the next stage after confident walking, requiring coordination and balance."), actionNote: copy(ru: "Если ребенок часто падает или ходьба всё ещё неустойчива, обсудите моторное развитие.", uk: "Якщо дитина часто падає або ходьба все ще нестійка, обговоріть моторний розвиток.", en: "If the child falls often or walking is still unsteady, discuss motor development."), isFlexibleVariant: false),
        Milestone(id: "simple-puzzles-30m", title: copy(ru: "Собирает простые пазлы или вкладыши", uk: "Складає прості пазли або вкладиші", en: "Completes simple puzzles or shape sorters"), domain: .cognition, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Пазлы показывают пространственное мышление и мелкую моторику.", uk: "Пазли показують просторове мислення та дрібну моторику.", en: "Puzzles show spatial thinking and fine motor skills."), actionNote: copy(ru: "Если ребенок не проявляет интереса к предметной игре, обсудите когнитивное развитие.", uk: "Якщо дитина не виявляє інтересу до предметної гри, обговоріть когнітивний розвиток.", en: "If the child shows no interest in object play, discuss cognitive development."), isFlexibleVariant: false),
        Milestone(id: "pretend-play-30m", title: copy(ru: "Начинает ролевую игру (кормит куклу, говорит по телефону)", uk: "Починає рольову гру (годує ляльку, говорить по телефону)", en: "Begins pretend play (feeds doll, talks on phone)"), domain: .social, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Ролевая игра — маркер символического мышления и социального развития.", uk: "Рольова гра — маркер символічного мислення та соціального розвитку.", en: "Pretend play is a marker of symbolic thinking and social development."), actionNote: copy(ru: "Отсутствие ролевой игры к 30 месяцам вместе с другими задержками — повод для скрининга.", uk: "Відсутність рольової гри до 30 місяців разом з іншими затримками — привід для скринінгу.", en: "No pretend play by 30 months alongside other delays warrants screening."), isFlexibleVariant: false),
        Milestone(id: "eats-fork-30m", title: copy(ru: "Ест вилкой", uk: "Їсть виделкою", en: "Eats with a fork"), domain: .feeding, dueMonth: 30, evidence: .cdc75, sources: ["cdc-milestones", "who-feeding"], clinicalNote: copy(ru: "Использование вилки требует координации и развития мелкой моторики.", uk: "Використання виделки потребує координації та розвитку дрібної моторики.", en: "Fork use requires coordination and fine motor development."), actionNote: copy(ru: "Если ребенок не пробует есть столовыми приборами и отказывается от текстур, обсудите кормление.", uk: "Якщо дитина не пробує їсти столовими приборами і відмовляється від текстур, обговоріть годування.", en: "If the child does not try utensils and refuses textures, discuss feeding."), isFlexibleVariant: false),
        Milestone(id: "screening-30m", title: copy(ru: "Стандартизированный скрининг развития", uk: "Стандартизований скринінг розвитку", en: "Standardized developmental screening"), domain: .screening, dueMonth: 30, evidence: .aapScreening, sources: ["aap-screening", "cdc-milestones"], clinicalNote: copy(ru: "AAP рекомендует общий скрининг развития в 9, 18 и 30 месяцев.", uk: "AAP рекомендує загальний скринінг розвитку у 9, 18 і 30 місяців.", en: "AAP recommends general developmental screening at 9, 18, and 30 months."), actionNote: copy(ru: "Спросите врача о валидированном инструменте (ASQ-3, PEDS). Если есть тревоги — не ждите планового срока.", uk: "Запитайте лікаря про валідований інструмент (ASQ-3, PEDS). Якщо є тривоги — не чекайте планового строку.", en: "Ask about a validated tool (ASQ-3, PEDS). If concerned, do not wait for the scheduled time."), isFlexibleVariant: false),
        // MARK: - 36 months
        Milestone(id: "three-word-sentences-36m", title: copy(ru: "Говорит предложениями из 3+ слов", uk: "Говорить реченнями з 3+ слів", en: "Speaks in 3+ word sentences"), domain: .communication, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "К 3 годам большинство детей строят фразы из 3 слов и их понимают незнакомые люди.", uk: "До 3 років більшість дітей будують фрази з 3 слів і їх розуміють незнайомі люди.", en: "By 3 years most children form 3-word sentences understood by strangers."), actionNote: copy(ru: "Если речь непонятна незнакомым или нет фраз, попросите оценку речевого развития.", uk: "Якщо мовлення незрозуміле незнайомим або немає фраз, попросіть оцінку мовленнєвого розвитку.", en: "If speech is unclear to strangers or no phrases, request speech evaluation."), isFlexibleVariant: false),
        Milestone(id: "draws-circle-36m", title: copy(ru: "Рисует круг", uk: "Малює коло", en: "Draws a circle"), domain: .fineMotor, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Рисование круга показывает контроль мелкой моторики и зрительно-моторную координацию.", uk: "Малювання кола показує контроль дрібної моторики та зорово-моторну координацію.", en: "Drawing a circle shows fine motor control and hand-eye coordination."), actionNote: copy(ru: "Если ребенок не держит карандаш или не рисует никаких форм, обсудите мелкую моторику.", uk: "Якщо дитина не тримає олівець або не малює жодних форм, обговоріть дрібну моторику.", en: "If the child cannot hold a crayon or draw any shapes, discuss fine motor skills."), isFlexibleVariant: false),
        Milestone(id: "climbs-stairs-alternating-36m", title: copy(ru: "Поднимается по ступенькам, чередуя ноги", uk: "Піднімається сходами, чергуючи ноги", en: "Climbs stairs alternating feet"), domain: .motor, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Чередование ног на лестнице требует баланса, силы и координации.", uk: "Чергування ніг на сходах потребує балансу, сили та координації.", en: "Alternating feet on stairs requires balance, strength, and coordination."), actionNote: copy(ru: "Если ребенок не поднимается по лестнице с поддержкой, обсудите моторное развитие.", uk: "Якщо дитина не піднімається сходами з підтримкою, обговоріть моторний розвиток.", en: "If the child cannot climb stairs with support, discuss motor development."), isFlexibleVariant: false),
        Milestone(id: "dresses-self-36m", title: copy(ru: "Надевает некоторую одежду сам", uk: "Вдягає деякий одяг самостійно", en: "Puts on some clothes independently"), domain: .cognition, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Одевание — комплексный навык, сочетающий моторику, планирование и самостоятельность.", uk: "Одягання — комплексна навичка, що поєднує моторику, планування та самостійність.", en: "Dressing is a complex skill combining motor skills, planning, and independence."), actionNote: copy(ru: "Если ребенок не участвует в одевании, обсудите навыки самообслуживания.", uk: "Якщо дитина не бере участі в одяганні, обговоріть навички самообслуговування.", en: "If the child does not participate in dressing, discuss self-care skills."), isFlexibleVariant: false),
        Milestone(id: "plays-with-others-36m", title: copy(ru: "Играет с другими детьми, не только рядом", uk: "Грає з іншими дітьми, не лише поруч", en: "Plays with other children, not just alongside"), domain: .social, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Переход от параллельной к совместной игре — важный социальный этап.", uk: "Перехід від паралельної до спільної гри — важливий соціальний етап.", en: "Transition from parallel to cooperative play is an important social milestone."), actionNote: copy(ru: "Если ребенок совсем не интересуется другими детьми, обсудите социальное развитие.", uk: "Якщо дитина зовсім не цікавиться іншими дітьми, обговоріть соціальний розвиток.", en: "If the child shows no interest in other children, discuss social development."), isFlexibleVariant: false),
        Milestone(id: "calms-after-separation-36m", title: copy(ru: "Успокаивается в течение 10 минут после разлуки", uk: "Заспокоюється протягом 10 хвилин після розлуки", en: "Calms within 10 minutes after separation"), domain: .social, dueMonth: 36, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Способность успокаиваться — маркер эмоциональной регуляции.", uk: "Здатність заспокоюватися — маркер емоційної регуляції.", en: "Ability to calm down is a marker of emotional regulation."), actionNote: copy(ru: "Постоянная сильная тревога разлуки после 3 лет может требовать внимания.", uk: "Постійна сильна тривога розлуки після 3 років може потребувати уваги.", en: "Persistent intense separation anxiety after age 3 may need attention."), isFlexibleVariant: false),
        // MARK: - 48 months
        Milestone(id: "names-colors-48m", title: copy(ru: "Называет несколько цветов", uk: "Називає кілька кольорів", en: "Names some colors"), domain: .cognition, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Называние цветов показывает развитие категоризации и речи.", uk: "Називання кольорів показує розвиток категоризації та мовлення.", en: "Naming colors shows categorization and language development."), actionNote: copy(ru: "Если ребенок не различает цвета, обсудите зрение и когнитивное развитие.", uk: "Якщо дитина не розрізняє кольори, обговоріть зір та когнітивний розвиток.", en: "If the child cannot distinguish colors, discuss vision and cognitive development."), isFlexibleVariant: false),
        Milestone(id: "tells-story-48m", title: copy(ru: "Рассказывает, что было (пересказ событий)", uk: "Розповідає, що було (переказ подій)", en: "Tells about past events (retells stories)"), domain: .communication, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Пересказ событий требует памяти, последовательности и речи.", uk: "Переказ подій потребує пам'яті, послідовності та мовлення.", en: "Retelling events requires memory, sequencing, and language."), actionNote: copy(ru: "Если ребенок не строит фраз из 3+ слов к 4 годам, попросите оценку речи.", uk: "Якщо дитина не будує фраз із 3+ слів до 4 років, попросіть оцінку мовлення.", en: "If the child does not form 3+ word phrases by age 4, request speech evaluation."), isFlexibleVariant: false),
        Milestone(id: "catches-ball-48m", title: copy(ru: "Ловит мяч большого размера", uk: "Ловить м'яч великого розміру", en: "Catches a large ball"), domain: .motor, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Ловля мяча показывает координацию, зрительно-моторную интеграцию.", uk: "Ловіння м'яча показує координацію, зорово-моторну інтеграцію.", en: "Catching a ball shows coordination and visual-motor integration."), actionNote: copy(ru: "Если ребенок не может ловить или бросать, обсудите моторное развитие.", uk: "Якщо дитина не може ловити чи кидати, обговоріть моторний розвиток.", en: "If the child cannot catch or throw, discuss motor development."), isFlexibleVariant: false),
        Milestone(id: "uses-scissors-48m", title: copy(ru: "Пробует резать ножницами", uk: "Пробує різати ножицями", en: "Tries to cut with scissors"), domain: .fineMotor, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Ножницы требуют двусторонней координации и силы пальцев.", uk: "Ножиці потребують двосторонньої координації та сили пальців.", en: "Scissors require bilateral coordination and finger strength."), actionNote: copy(ru: "Если ребенок не может удержать мелкие предметы, обсудите мелкую моторику.", uk: "Якщо дитина не може утримати дрібні предмети, обговоріть дрібну моторику.", en: "If the child cannot hold small objects, discuss fine motor skills."), isFlexibleVariant: false),
        Milestone(id: "names-first-last-48m", title: copy(ru: "Называет имя и фамилию", uk: "Називає ім'я та прізвище", en: "Tells first and last name"), domain: .cognition, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Знание своего имени и фамилии — маркер самосознания и памяти.", uk: "Знання свого імені та прізвища — маркер самосвідомості та пам'яті.", en: "Knowing first and last name is a marker of self-awareness and memory."), actionNote: copy(ru: "Если ребенок не знает своего имени к 4 годам, обсудите когнитивное развитие.", uk: "Якщо дитина не знає свого імені до 4 років, обговоріть когнітивний розвиток.", en: "If the child does not know their name by age 4, discuss cognitive development."), isFlexibleVariant: false),
        Milestone(id: "plays-cooperatively-48m", title: copy(ru: "Предпочитает играть с детьми, а не в одиночку", uk: "Віддає перевагу грі з дітьми, а не наодинці", en: "Prefers playing with children over playing alone"), domain: .social, dueMonth: 48, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Предпочтение совместной игры показывает социальную мотивацию.", uk: "Перевага спільної гри показує соціальну мотивацію.", en: "Preference for cooperative play shows social motivation."), actionNote: copy(ru: "Полное избегание других детей к 4 годам — повод обсудить социальное развитие.", uk: "Повне уникнення інших дітей до 4 років — привід обговорити соціальний розвиток.", en: "Complete avoidance of other children by age 4 warrants discussing social development."), isFlexibleVariant: false),
        // MARK: - 60 months
        Milestone(id: "counts-to-ten-60m", title: copy(ru: "Считает до 10", uk: "Рахує до 10", en: "Counts to 10"), domain: .cognition, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Счёт — основа математического мышления и подготовки к школе.", uk: "Лічба — основа математичного мислення та підготовки до школи.", en: "Counting is foundational for math thinking and school readiness."), actionNote: copy(ru: "Если ребенок не считает и не различает цифры к 5 годам, обсудите подготовку к школе.", uk: "Якщо дитина не рахує і не розрізняє цифри до 5 років, обговоріть підготовку до школи.", en: "If the child cannot count or recognize numbers by age 5, discuss school readiness."), isFlexibleVariant: false),
        Milestone(id: "writes-letters-60m", title: copy(ru: "Пишет некоторые буквы своего имени", uk: "Пише деякі літери свого імені", en: "Writes some letters of their name"), domain: .fineMotor, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Письмо букв требует зрительно-моторной координации и памяти форм.", uk: "Написання літер потребує зорово-моторної координації та пам'яті форм.", en: "Writing letters requires hand-eye coordination and shape memory."), actionNote: copy(ru: "Если ребенок не может нарисовать простые формы, обсудите мелкую моторику и подготовку к школе.", uk: "Якщо дитина не може намалювати прості форми, обговоріть дрібну моторику та підготовку до школи.", en: "If the child cannot draw simple shapes, discuss fine motor skills and school readiness."), isFlexibleVariant: false),
        Milestone(id: "dresses-independently-60m", title: copy(ru: "Одевается и раздевается без помощи", uk: "Одягається та роздягається без допомоги", en: "Dresses and undresses without help"), domain: .cognition, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Полностью самостоятельное одевание — навык, требующий планирования и моторики.", uk: "Повністю самостійне одягання — навичка, що потребує планування та моторики.", en: "Fully independent dressing requires planning and motor skills."), actionNote: copy(ru: "Если ребенок не участвует в самообслуживании к 5 годам, обсудите навыки повседневной жизни.", uk: "Якщо дитина не бере участі в самообслуговуванні до 5 років, обговоріть навички повсякденного життя.", en: "If the child does not participate in self-care by age 5, discuss daily living skills."), isFlexibleVariant: false),
        Milestone(id: "answers-questions-60m", title: copy(ru: "Отвечает на простые вопросы по рассказу", uk: "Відповідає на прості запитання за розповіддю", en: "Answers simple questions about a story"), domain: .communication, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Ответы на вопросы по тексту показывают понимание и когнитивное развитие.", uk: "Відповіді на запитання за текстом показують розуміння та когнітивний розвиток.", en: "Answering questions about a story shows comprehension and cognitive development."), actionNote: copy(ru: "Если ребенок не понимает простых вопросов, обсудите речевое и когнитивное развитие.", uk: "Якщо дитина не розуміє простих запитань, обговоріть мовленнєвий та когнітивний розвиток.", en: "If the child cannot understand simple questions, discuss speech and cognitive development."), isFlexibleVariant: false),
        Milestone(id: "hops-on-one-foot-60m", title: copy(ru: "Прыгает на одной ноге", uk: "Стрибає на одній нозі", en: "Hops on one foot"), domain: .motor, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Прыжки на одной ноге требуют баланса, силы и координации.", uk: "Стрибки на одній нозі потребують балансу, сили та координації.", en: "Hopping on one foot requires balance, strength, and coordination."), actionNote: copy(ru: "Если ребенок не может прыгать обеими ногами к 5 годам, обсудите моторное развитие.", uk: "Якщо дитина не може стрибати обома ногами до 5 років, обговоріть моторний розвиток.", en: "If the child cannot jump with both feet by age 5, discuss motor development."), isFlexibleVariant: false),
        Milestone(id: "shows-empathy-60m", title: copy(ru: "Проявляет сочувствие (жалеет расстроенного друга)", uk: "Виявляє співчуття (жаліє засмученого друга)", en: "Shows empathy (comforts an upset friend)"), domain: .social, dueMonth: 60, evidence: .cdc75, sources: ["cdc-milestones"], clinicalNote: copy(ru: "Эмпатия к 5 годам — важный маркер социально-эмоционального развития.", uk: "Емпатія до 5 років — важливий маркер соціально-емоційного розвитку.", en: "Empathy by age 5 is an important marker of social-emotional development."), actionNote: copy(ru: "Полное отсутствие интереса к чувствам других может требовать внимания.", uk: "Повна відсутність інтересу до почуттів інших може потребувати уваги.", en: "Complete lack of interest in others' feelings may need attention."), isFlexibleVariant: false)
    ].sorted { left, right in
        if left.dueMonth == right.dueMonth {
            return left.id < right.id
        }
        return left.dueMonth < right.dueMonth
    }

    static func source(for id: String) -> SourceReference? {
        sources.first { $0.id == id }
    }
}
