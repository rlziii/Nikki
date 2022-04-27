import SwiftUI

struct JournalEntryRowView: View {
    private let journalEntry: JournalEntry

    init(_ journalEntry: JournalEntry) {
        self.journalEntry = journalEntry
    }

    var body: some View {
        VStack {
            Text(journalEntry.title)
                .font(.title2)
                .multilineTextAlignment(.center)

            Text(journalEntry.body)
                .lineLimit(2)
                .font(.headline)

            HStack(alignment: .bottom) {
                if let author = journalEntry.author {
                    Text("by: \(author)")
                        .font(.subheadline)
                }

                Text(journalEntry.date, format: .dateTime)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }.padding(.vertical)
    }
}

struct JournalEntryRowView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryRowView(.preview)
            .previewLayout(.sizeThatFits)
    }
}
