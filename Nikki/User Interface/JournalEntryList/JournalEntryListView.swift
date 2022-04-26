import SwiftUI

struct JournalEntryListView: View {
    @ObservedObject var viewModel: JournalEntryListViewModel

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
        .navigationTitle(Text("Journal Entries"))
        .toolbar(
            content: toolbarContent
        )
        .sheet(
            item: $viewModel.route,
            onDismiss: viewModel.dismissSheet,
            content: sheetContent
        )
    }

    private func toolbarContent() -> some ToolbarContent {
        Group {
            ToolbarItemGroup {
                EditButton()
                    .disabled(!viewModel.editButtonEnabled)
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

    @ViewBuilder private func sheetContent(route: AppRoute) -> some View {
        switch route {
        case .detail(let journalDetailViewModel):
            NavigationView {
                JournalDetailView(viewModel: journalDetailViewModel)
                    .navigationTitle(Text(viewModel.detailViewSheetNavigationTitle))
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
