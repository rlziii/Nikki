import SwiftUI

struct JournalEntryListView: View {
    @ObservedObject var viewModel: JournalEntryListViewModel

    var body: some View {
        List {
            ForEach(viewModel.journalEntries) { journalEntry in
                Button {
                    viewModel.editJournalEntry(with: journalEntry.id)
                } label: {
                    JournalEntryRowView(journalEntry)
                }
                .tint(.primary)
            }

            .onMove(perform: viewModel.move)
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle(Text("Journal Entries"))
        .toolbar(
            content: toolbarContent
        )
        .sheet(
            item: $viewModel.route,
            content: sheetContent
        )
    }

    private func toolbarContent() -> some ToolbarContent {
        Group {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    viewModel.showSettings()
                } label: {
                    Image(systemName: "gear")
                }

            }

            ToolbarItemGroup(placement: .navigationBarTrailing) {
                EditButton()
                    .disabled(!viewModel.editButtonEnabled)
            }

            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button {
                    viewModel.addJournalEntry()
                } label: {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                }
            }
        }
    }

    @ViewBuilder private func sheetContent(route: AppRoute) -> some View {
        switch route {
        case .detail(let journalDetailViewModel):
            NavigationView {
                JournalDetailView(viewModel: journalDetailViewModel)
            }
        case .settings:
            NavigationView {
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalEntryListView(viewModel: .init(journalEntries: .previews))
        }
    }
}
