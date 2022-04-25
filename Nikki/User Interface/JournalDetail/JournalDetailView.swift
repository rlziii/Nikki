import SwiftUI

struct JournalDetailView: View {
    @StateObject private var viewModel = JournalDetailViewModel()
    @FocusState private var focusTextField: Bool
    @Environment(\.dismiss) private var dismiss

    // Passthrough into view model.
    private let journalEntry: JournalEntry?
    private let saveAction: (JournalEntry) -> Void

    init(_ journalEntry: JournalEntry? = nil, saveAction: @escaping (JournalEntry) -> Void) {
        self.journalEntry = journalEntry
        self.saveAction = saveAction
    }

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.titleText)
                    .focused($focusTextField)
            } header: {
                Text("Title")
            }

            Section {
                Toggle("Include Author", isOn: $viewModel.includeAuthor)

                if viewModel.includeAuthor {
                    TextField("Author name", text: $viewModel.authorText)
                }
            } header: {
                Text("Author Information")
            }

            Section {
                TextEditor(text: $viewModel.bodyText)
            } header: {
                Text("Journal Entry")
            }

            Section {
                Button("Save", action: save)
                    .disabled(!viewModel.saveButtonEnabled)
            }
        }
        .animation(.default, value: viewModel.includeAuthor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: configure)
        .toolbar {
            ToolbarItemGroup(placement: .cancellationAction) {
                Button("Cancel", action: { dismiss() })
                    .keyboardShortcut(.cancelAction)
            }

            ToolbarItemGroup(placement: .primaryAction) {
                Button("Save", action: save)
                    .keyboardShortcut(.defaultAction)
                    .disabled(!viewModel.saveButtonEnabled)
            }
        }
    }

    private func save() {
        viewModel.save()
        dismiss()
    }

    private func configure() {
        viewModel.configure(
            withJournalEntry: journalEntry,
            saveAction: saveAction
        )

        Task { @MainActor in
            // Delay needed to wait for `onAppear` animation to finish.
            try await Task.sleep(nanoseconds: 600_000_000)
            focusTextField = true
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
