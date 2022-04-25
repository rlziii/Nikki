import SwiftUI

struct JournalEntryListView: View {
    @StateObject private var viewModel = JournalEntryListViewModel()

    @State private var detailViewJournalEntry: JournalEntry?
    @State private var addSheetIsPresented = false

    var body: some View {
        List {
            ForEach(viewModel.journalEntries) { journalEntry in
                Button {
                    detailViewJournalEntry = journalEntry
                    addSheetIsPresented = true
                } label: {
                    JournalEntryRowView(journalEntry)
                }
                .buttonStyle(.plain)
            }
            .onMove(perform: viewModel.move)
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Journal Entries")
        .toolbar(
            content: toolbarContent
        )
        .sheet(
            isPresented: $addSheetIsPresented,
            onDismiss: onSheetDismiss,
            content: sheetContent
        )
    }

    private func toolbarContent() -> some ToolbarContent {
        Group {
            ToolbarItemGroup {
                EditButton()
            }

            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button {
                    addSheetIsPresented = true
                } label: {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                }
            }
        }
    }

    private func sheetContent() -> some View {
        NavigationView {
            JournalDetailView(saveAction: viewModel.add)
                .navigationTitle("Create Journal Entry")
        }
    }

    private func onSheetDismiss() {
        detailViewJournalEntry = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalEntryListView()
        }
    }
}
