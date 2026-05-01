//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

public struct DSShadow {
  public let color: Color
  public let radius: CGFloat
  public let x: CGFloat
  public let y: CGFloat
}

public enum DSShadows {
  public static let light = DSShadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
  public static let medium = DSShadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
  public static let heavy = DSShadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
}
