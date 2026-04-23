# Рост рядом

SwiftUI iOS app for tracking infant developmental milestones in Russian.

The app is intentionally conservative: it records observations, shows age windows, and suggests when to discuss a question with a pediatrician. It does not diagnose delay.

## Evidence Base

- CDC Learn the Signs. Act Early. developmental milestones: https://www.cdc.gov/act-early/milestones/index.html
- American Academy of Pediatrics developmental surveillance and screening: https://www.aap.org/en/patient-care/screening-technical-assistance-and-resource-center/surveillancemonitoring-and-screening/
- WHO Motor Development Study: https://doi.org/10.1080/08035320500495563
- WHO complementary feeding guidance: https://www.who.int/health-topics/complementary-feeding
- AAP / HealthyChildren corrected age for preterm infants: https://www.healthychildren.org/English/ages-stages/baby/preemie/Pages/Corrected-Age-For-Preemies.aspx

## Build

Open `BabyMilestones.xcodeproj` in Xcode 26 or run:

```sh
xcodebuild -project BabyMilestones.xcodeproj -scheme BabyMilestones -destination 'generic/platform=iOS Simulator' build
```
