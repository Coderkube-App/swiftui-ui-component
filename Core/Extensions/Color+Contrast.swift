//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

extension Color {
  public func isLight() -> Bool {
    guard let components = UIColor(self).cgColor.components, components.count >= 3 else {
      return true
    }
    
    let r = components[0]
    let g = components[1]
    let b = components[2]
    
    // Using relative luminance formula
    let luminance = (0.299 * r + 0.587 * g + 0.114 * b)
    return luminance > 0.6
  }
  
  public func onColor() -> Color {
    return isLight() ? Color.black : Color.white
  }
}
