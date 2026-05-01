//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

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
