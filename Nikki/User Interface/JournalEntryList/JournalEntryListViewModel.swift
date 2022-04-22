import Combine

class JournalEntryListViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = [.preview]
}
