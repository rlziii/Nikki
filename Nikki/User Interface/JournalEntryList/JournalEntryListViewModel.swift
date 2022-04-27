import Combine
import Foundation

// For `withAnimation(_:_:)`
import SwiftUI

class JournalEntryListViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = [.preview]
    @Published var route: AppRoute?

    var editButtonEnabled: Bool {
        !journalEntries.isEmpty
    }

    init(
        journalEntries: [JournalEntry] = .init(),
        route: AppRoute? = nil
    ) {
        self.journalEntries = journalEntries
        self.route = route
    }

    func add(journalEntry: JournalEntry) {
        withAnimation {
            journalEntries.insert(journalEntry, at: 0)
        }
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

    func editJournalEntry(with id: UUID) {
        if let journalEntry = journalEntries.first(where: { $0.id == id }) {
            route = .detail(.init(
                initialJouralEntry: journalEntry,
                saveAction: { [weak self] in
                    self?.update(journalEntry: $0)
                }
            ))
        }
    }

    func addJournalEntry() {
        route = .detail(.init(
            saveAction: { [weak self] in
                self?.add(journalEntry: $0)
            }
        ))
    }

    func showSettings() {
        route = .settings
    }
}
