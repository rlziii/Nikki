import Foundation

enum AppRoute: Identifiable {
    case detail(JournalDetailViewModel)
    case settings(SettingsViewModel)

    var id: String {
        switch self {
        case .detail(let journalDetailViewModel):
            return journalDetailViewModel.initialJournalEntry?.id.uuidString ?? "add"
        case .settings:
            return "settings"
        }
    }
}
