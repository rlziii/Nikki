import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Hello, World!")
            .navigationTitle(Text("Settings"))
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
