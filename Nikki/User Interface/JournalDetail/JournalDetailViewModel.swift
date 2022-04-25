import Combine

class JournalDetailViewModel: ObservableObject {
    @Published var titleText = ""
    @Published var bodyText = ""
    @Published var authorText = ""
    @Published var includeAuthor = false

    var initialJournalEntry: JournalEntry?
    var saveAction: ((JournalEntry) -> Void)?

    var saveButtonEnabled: Bool {
        let titleTextIsValid = !titleText.isEmpty
        let bodyTextIsValid = !bodyText.isEmpty
        let authorTextIsValid = includeAuthor ? (!authorText.isEmpty) : true
        let changesMade: Bool = {
            if let initialJournalEntry = initialJournalEntry {
                return (titleText != initialJournalEntry.title) ||
                (bodyText != initialJournalEntry.body) ||
                (includeAuthor ? authorText != initialJournalEntry.author : true)
            } else {
                return true
            }
        }()

        return titleTextIsValid && bodyTextIsValid && authorTextIsValid && changesMade
    }

    func configure(withJournalEntry initialJournalEntry: JournalEntry?, saveAction: @escaping (JournalEntry) -> Void) {
        self.initialJournalEntry = initialJournalEntry
        self.saveAction = saveAction

        titleText = initialJournalEntry?.title ?? ""
        bodyText = initialJournalEntry?.body ?? ""
        authorText = initialJournalEntry?.author ?? ""
        includeAuthor = initialJournalEntry?.author != nil
    }

    func save() {
        let journalEntry = JournalEntry(
            id: initialJournalEntry?.id ?? .init(),
            title: titleText,
            body: bodyText,
            date: .now,
            author: includeAuthor ? authorText : nil
        )

        saveAction?(journalEntry)
    }
}
