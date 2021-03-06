import SwiftUI

@main
struct Application: App {
    @StateObject private var appState = AppState(
        journalEntryListViewModel: .init(
            journalEntries: .previews,
            settingsStorage: .init()
        )
    )

    var body: some Scene {
        WindowGroup {
            NavigationView {
                JournalEntryListView(viewModel: appState.journalEntryListViewModel)
            }
        }
    }
}
