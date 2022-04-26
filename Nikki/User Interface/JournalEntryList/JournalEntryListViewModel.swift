import Combine
import Foundation
import SwiftUI

class JournalEntryListViewModel: ObservableObject {
    @Published private(set) var journalEntries: [JournalEntry] = [.preview]
    @Published var route: AppRoute?

    var detailViewSheetNavigationTitle: LocalizedStringKey {
        switch route {
        case .detail(let viewModel) where viewModel.initialJournalEntry != nil:
            return "Edit Journal Entry"
        default:
            return "Create Journal Entry"
        }
    }

    var editButtonEnabled: Bool { !journalEntries.isEmpty }

    init(
        journalEntries: [JournalEntry] = .init(),
        route: AppRoute? = nil
    ) {
        self.journalEntries = journalEntries
        self.route = route
    }

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
        if let id = journalEntryID, let journalEntry = journalEntries.first(where: { $0.id == id }) {
            route = .detail(.init(
                initialJouralEntry: journalEntry,
                saveAction: { [weak self] in
                    self?.update(journalEntry: $0)
                }
            ))
        } else {
            route = .detail(.init(
                saveAction: { [weak self] in
                    self?.add(journalEntry: $0)
                }
            ))
        }
    }

    func dismissSheet() {
        route = nil
    }
}
