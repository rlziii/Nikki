import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var simpleRowsEnabled = false
    @Published var defaultAuthorName = ""

    let appURL = URL(string: "https://github.com/rlziii/Nikki")!
    let versionNumber = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let buildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section {
                TextField("Default Author Name", text: $viewModel.defaultAuthorName)
            } header: {
                Text("Author Info")
            }

            Section {
                Toggle("Simple Rows", isOn: $viewModel.simpleRowsEnabled)
            } header: {
                Text("App Settings")
            }

            Section {
                Link("GitHub", destination: viewModel.appURL)
            } header: {
                Text("App Info")
            } footer: {
                versionAndBuildInfoFooter()
            }
        }
        .navigationTitle(Text("Settings"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .cancellationAction) {
                Button("Cancel", action: { dismiss() })
                    .keyboardShortcut(.cancelAction)
            }
        }
    }

    func versionAndBuildInfoFooter() -> some View {
        HStack {
            HStack(spacing: 0) {
                Text("Version number: ")
                Text(verbatim: viewModel.versionNumber)
            }

            Spacer()

            HStack(spacing: 0) {
                Text("Build number: ")
                Text(verbatim: viewModel.buildNumber)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
        .navigationTitle(Text("Settings"))
    }
}
