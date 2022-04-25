import Combine
import Foundation

class JournalEntryListViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = [.preview]

    @Published private(set) var detailViewJournalEntry: JournalEntry?
    @Published var detailViewSheetIsPresented = false
    var detailViewSheetNavigationTitle: String { detailViewJournalEntry == nil ? "Create Journal Entry" : "Edit Journal Entry" }

    func add(journalEntry: JournalEntry) {
        journalEntries.append(journalEntry)
    }

    func update(journalEntry: JournalEntry) {
        if let index = journalEntries.firstIndex(where: { $0.id == journalEntry.id }) {
            journalEntries[index] = journalEntry
        }
    }

    func move(from indexSet: IndexSet, to offset: Int) {
        journalEntries.move(fromOffsets: indexSet, toOffset: offset)
    }

    func delete(indexSet: IndexSet) {
        journalEntries.remove(atOffsets: indexSet)
    }

    func presentSheet(with journalEntryID: UUID? = nil) {
        if
            let journalEntryID = journalEntryID,
            let journalEntry = journalEntries.first(where: { $0.id == journalEntryID })
        {
            detailViewJournalEntry = journalEntry
        }

        detailViewSheetIsPresented = true
    }

    func dismissSheet() {
        detailViewJournalEntry = nil
        detailViewSheetIsPresented = false
    }
}
