import SwiftUI

struct JournalEntryListView: View {
    @StateObject private var viewModel = JournalEntryListViewModel()

    var body: some View {
        List {
            ForEach(viewModel.journalEntries) { journalEntry in
                Button {
                    viewModel.presentSheet(with: journalEntry.id)
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
            isPresented: $viewModel.detailViewSheetIsPresented,
            onDismiss: viewModel.dismissSheet,
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
                    viewModel.presentSheet()
                } label: {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                }
            }
        }
    }

    private func sheetContent() -> some View {
        NavigationView {
            JournalDetailView(viewModel.detailViewJournalEntry, saveAction: viewModel.addOrUpdate)
                .navigationTitle(viewModel.detailViewSheetNavigationTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalEntryListView()
        }
    }
}
