# Evie

iOS-застосунок на SwiftUI для відстеження етапів розвитку немовлят російською мовою.

Застосунок є навмисно консервативним: він фіксує спостереження, показує вікові вікна та підказує, коли варто обговорити питання з педіатром. Він не ставить діагнозів про затримку розвитку.

## Доказова база

- CDC Learn the Signs. Act Early. developmental milestones: https://www.cdc.gov/act-early/milestones/index.html
- American Academy of Pediatrics developmental surveillance and screening: https://www.aap.org/en/patient-care/screening-technical-assistance-and-resource-center/surveillancemonitoring-and-screening/
- WHO Motor Development Study: https://doi.org/10.1080/08035320500495563
- WHO complementary feeding guidance: https://www.who.int/health-topics/complementary-feeding
- AAP / HealthyChildren corrected age for preterm infants: https://www.healthychildren.org/English/ages-stages/baby/preemie/Pages/Corrected-Age-For-Preemies.aspx

## Збірка

Відкрийте `BabyMilestones.xcodeproj` у Xcode 26 або виконайте:

```sh
xcodebuild -project BabyMilestones.xcodeproj -scheme BabyMilestones -destination 'generic/platform=iOS Simulator' build
```
