import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
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
        .task(viewModel.loadSettings)
        .toolbar {
            ToolbarItemGroup(placement: .cancellationAction) {
                Button("Cancel", action: { dismiss() })
                    .keyboardShortcut(.cancelAction)
            }

            ToolbarItemGroup(placement: .primaryAction) {
                Button("Save", action: save)
                    .disabled(!viewModel.saveButtonEnabled)
                    .keyboardShortcut(.defaultAction)
            }
        }
    }

    private func save() {
        Task {
            await viewModel.saveChanges()
            dismiss()
        }
    }

    private func versionAndBuildInfoFooter() -> some View {
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
            SettingsView(viewModel: .init(storage: .init()))
        }
        .navigationTitle(Text("Settings"))
    }
}
