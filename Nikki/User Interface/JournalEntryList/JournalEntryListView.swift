import SwiftUI

struct JournalEntryListView: View {
    @StateObject private var viewModel = JournalEntryListViewModel()

    var body: some View {
        List(viewModel.journalEntries) {
            JournalEntryRowView($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryListView()
    }
}
