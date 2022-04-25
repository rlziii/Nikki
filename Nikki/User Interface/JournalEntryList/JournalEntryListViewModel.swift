import Combine
import Foundation

class JournalEntryListViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = [.preview]

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
}
