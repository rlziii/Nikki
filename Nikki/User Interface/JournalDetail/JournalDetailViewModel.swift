import Combine

class JournalDetailViewModel: ObservableObject {
    @Published var titleText: String
    @Published var bodyText: String
    @Published var authorText: String
    @Published var includeAuthor: Bool

    var navigationTitle: String {
        initialJournalEntry == nil ? "Create Journal Entry" : "Edit Journal Entry"
    }

    let initialJournalEntry: JournalEntry?
    private let saveAction: (JournalEntry) -> Void

    init(
        initialJouralEntry: JournalEntry? = nil,
        saveAction: @escaping (JournalEntry) -> Void
    ) {
        self.initialJournalEntry = initialJouralEntry
        self.saveAction = saveAction

        self.titleText = initialJournalEntry?.title ?? ""
        self.bodyText = initialJournalEntry?.body ?? ""
        self.authorText = initialJournalEntry?.author ?? ""
        self.includeAuthor = initialJournalEntry?.author != nil
    }

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

    func save() {
        let journalEntry = JournalEntry(
            id: initialJournalEntry?.id ?? .init(),
            title: titleText,
            body: bodyText,
            date: .now,
            author: includeAuthor ? authorText : nil
        )

        saveAction(journalEntry)
    }
}
