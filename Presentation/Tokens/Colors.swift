//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

public enum DSColors {
  // MARK: - Core Palette
  public enum Core {
    public static let blue500 = Color(red: 0.2, green: 0.4, blue: 1.0)
    public static let blue600 = Color(red: 0.15, green: 0.35, blue: 0.9)
    public static let purple500 = Color(red: 0.5, green: 0.2, blue: 0.8)
    public static let green500 = Color(red: 0.2, green: 0.8, blue: 0.4)
    public static let yellow500 = Color(red: 1.0, green: 0.7, blue: 0.0)
    public static let red500 = Color(red: 0.9, green: 0.2, blue: 0.2)
    
    public static let gray100 = Color(white: 0.95)
    public static let gray200 = Color(white: 0.9)
    public static let gray800 = Color(white: 0.2)
    public static let gray900 = Color(white: 0.1)
  }
  
  // MARK: - Semantic Colors (Defaults)
  public static let primary = Core.blue500
  public static let secondary = Core.purple500
  public static let success = Core.green500
  public static let warning = Core.yellow500
  public static let error = Core.red500
  
  // MARK: - Gradients
  public static let primaryGradient = LinearGradient(
    colors: [primary, secondary],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )
}
