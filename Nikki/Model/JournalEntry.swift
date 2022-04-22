import Foundation

struct JournalEntry: Identifiable {
    let id: UUID
    let title: String
    let body: String
    let date: Date

    let author: String?
}

extension JournalEntry {
    // From: https://www.apple.com/newsroom/2007/01/09Apple-Reinvents-the-Phone-with-iPhone/
    // iPhone launch date/time: 2007-01-09 at 09:41:00 PST
    static let preview = JournalEntry(
        id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!,
        title: "Apple Reinvents the Phone with iPhone",
        body: "Apple today introduced iPhone, combining three products—a revolutionary mobile phone, a widescreen iPod with touch controls, and a breakthrough Internet communications device with desktop-class email, web browsing, searching and maps—into one small and lightweight handheld device. iPhone introduces an entirely new user interface based on a large multi-touch display and pioneering new software, letting users control iPhone with just their fingers. iPhone also ushers in an era of software power and sophistication never before seen in a mobile device, which completely redefines what users can do on their mobile phones.",
        date: Date(timeIntervalSince1970: 1168364460),
        author: "John Appleseed"
    )
}
