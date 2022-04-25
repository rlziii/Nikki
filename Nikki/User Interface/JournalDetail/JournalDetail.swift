import SwiftUI

struct JournalDetailView: View {
    let journalEntry: JournalEntry?
    let saveAction: (JournalEntry) -> Void

    @State private var titleText = ""
    @State private var bodyText = ""
    @State private var authorText = ""
    @State private var includeAuthor = false

    @Environment(\.dismiss) var dismiss

    private var saveButtonEnabled: Bool {
        let titleTextIsValid = !titleText.isEmpty
        let bodyTextIsValid = !bodyText.isEmpty
        let authorTextIsValid = includeAuthor ? !authorText.isEmpty : true

        return titleTextIsValid && bodyTextIsValid && authorTextIsValid
    }

    init(_ journalEntry: JournalEntry? = nil, saveAction: @escaping (JournalEntry) -> Void) {
        self.journalEntry = journalEntry
        self.saveAction = saveAction
    }

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $titleText)
            } header: {
                Text("Title")
            }

            Section {
                Toggle("Include Author", isOn: $includeAuthor)

                if includeAuthor {
                    TextField("Author name", text: $authorText)
                }
            } header: {
                Text("Author Information")
            }

            Section {
                TextEditor(text: $bodyText)
            } header: {
                Text("Journal Entry")
            }

            Section {
                Button("Save", action: save)
                    .disabled(!saveButtonEnabled)
            }
        }
        .animation(.default, value: includeAuthor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: setupInitialValues)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Cancel", action: { dismiss() })
            }
        }
    }

    private func save() {
        let journalEntry = JournalEntry(
            id: journalEntry?.id ?? .init(),
            title: titleText,
            body: bodyText,
            date: .now,
            author: includeAuthor ? authorText : nil
        )

        saveAction(journalEntry)
        dismiss()
    }

    private func setupInitialValues() {
        Task { @MainActor in
            titleText = journalEntry?.title ?? ""
            bodyText = journalEntry?.body ?? ""
            authorText = journalEntry?.author ?? ""

            includeAuthor = journalEntry?.author != nil
        }
    }
}

struct JournalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalDetailView(.preview, saveAction: { _ in /* Do nothing. */})
                .navigationTitle("Create Journal Entry")
        }
    }
}
