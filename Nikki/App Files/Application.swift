import SwiftUI

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                JournalEntryListView()
            }
        }
    }
}
