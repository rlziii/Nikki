import Foundation

enum AppRoute: Identifiable {
    case detail(JournalDetailViewModel)

    var id: UUID {
        switch self {
        case .detail(let journalDetailViewModel):
            return journalDetailViewModel.initialJournalEntry?.id ?? UUID()
        }
    }
}
