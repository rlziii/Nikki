import SwiftUI

enum AppRoute: Identifiable {
    case detail(JournalDetailViewModel)

    var id: UUID { UUID() }
}

class AppState: ObservableObject {
    @Published var journalEntryListViewModel: JournalEntryListViewModel

    init(
        journalEntryListViewModel: JournalEntryListViewModel = .init()
    ) {
        self.journalEntryListViewModel = journalEntryListViewModel
    }
}

@main
struct Application: App {
    @StateObject private var appState = AppState(journalEntryListViewModel: .init(journalEntries: .previews))

    var body: some Scene {
        WindowGroup {
            NavigationView {
                JournalEntryListView(viewModel: appState.journalEntryListViewModel)
            }
        }
    }
}
