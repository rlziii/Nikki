import Foundation

actor SettingsStorage {
    enum SettingsKey: String {
        case simpleRows
        case defaultAuthor
    }

    private let defaults = UserDefaults.standard

    func save<T: Encodable>(_ value: T, key: SettingsKey) {
        defaults.set(value, forKey: key.rawValue)
    }

    func load<T: Decodable>(key: SettingsKey) -> T? {
        defaults.object(forKey: key.rawValue) as? T
    }
}
