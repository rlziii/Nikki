import Combine
import Foundation

class SettingsViewModel: ObservableObject {
    @Published var simpleRowsEnabled = false
    @Published var defaultAuthorName = ""

    var initialSimpleRowsEnabledValue: Bool?
    var initialDefaultAuthorNameValue: String?

    var saveButtonEnabled: Bool {
        let simpleRowsChanged = initialSimpleRowsEnabledValue != simpleRowsEnabled
        let defaultAuthorChanged = initialDefaultAuthorNameValue != defaultAuthorName
        let changesMade = simpleRowsChanged || defaultAuthorChanged

        return changesMade
    }

    private let storage: SettingsStorage

    init(storage: SettingsStorage) {
        self.storage = storage
    }

    let appURL = URL(string: "https://github.com/rlziii/Nikki")!
    let versionNumber = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let buildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String

    func saveChanges() async {
        await storage.save(simpleRowsEnabled, key: .simpleRows)
        await storage.save(defaultAuthorName, key: .defaultAuthor)
    }

    @MainActor @Sendable
    func loadSettings() async {
        simpleRowsEnabled = await storage.load(key: .simpleRows) ?? false
        defaultAuthorName = await storage.load(key: .defaultAuthor) ?? ""

        initialSimpleRowsEnabledValue = simpleRowsEnabled
        initialDefaultAuthorNameValue = defaultAuthorName
    }
}
