import SwiftUI

struct JournalEntryListView: View {
    @StateObject private var viewModel = JournalEntryListViewModel()
    @State private var addSheetIsPresented = false

    var body: some View {
        List {
            ForEach(viewModel.journalEntries) {
                JournalEntryRowView($0)
            }
            .onMove(perform: viewModel.move)
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Journal Entries")
        .toolbar {
            ToolbarItemGroup {
                EditButton()
            }

            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button(action: { addSheetIsPresented = true }) {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                }
            }
        }
        .sheet(isPresented: $addSheetIsPresented) {
            NavigationView {
                JournalDetailView(saveAction: viewModel.add)
                    .navigationTitle("Create Journal Entry")
            }
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
