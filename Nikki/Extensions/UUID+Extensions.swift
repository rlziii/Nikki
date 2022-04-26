import Foundation

extension UUID {
    init?(repeating character: Character) {
        let eight = String(repeating: character, count: 8)
        let four = String(repeating: character, count: 4)
        let twelve = String(repeating: character, count: 12)
        let uuidString = eight + "-" + four + "-" + four + "-" + four + "-" + twelve

        self.init(uuidString: uuidString)
    }
}
