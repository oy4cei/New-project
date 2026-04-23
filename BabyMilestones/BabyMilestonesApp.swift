import SwiftUI

@main
struct BabyMilestonesApp: App {
    @StateObject private var store = DevelopmentStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
