import SwiftUI

@main
struct DesignSystemApp: App {
  @StateObject private var themeManager = ThemeManager()
  
  var body: some Scene {
    WindowGroup {
      GalleryView()
        .environmentObject(themeManager)
    }
  }
}
