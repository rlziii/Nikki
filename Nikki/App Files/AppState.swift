import Combine

class AppState: ObservableObject {
    @Published var journalEntryListViewModel: JournalEntryListViewModel

    init(
        journalEntryListViewModel: JournalEntryListViewModel
    ) {
        self.journalEntryListViewModel = journalEntryListViewModel
    }
}
