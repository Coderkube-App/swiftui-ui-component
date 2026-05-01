import SwiftUI

public protocol AppTheme {
  var id: String { get }
  var name: String { get }
  
  // MARK: - Colors
  var primary: Color { get set }
  var secondary: Color { get }
  var background: Color { get }
  var secondaryBackground: Color { get }
  var surface: Color { get }
  var onSurface: Color { get }
  var text: Color { get }
  var secondaryText: Color { get }
  var separator: Color { get }
  
  // MARK: - Functional
  var success: Color { get }
  var warning: Color { get }
  var error: Color { get }
}

public struct LightTheme: AppTheme {
  public let id = "light"
  public let name = "Light"
  
  public var primary = DSColors.Core.blue500
  public let secondary = DSColors.Core.purple500
  public let background = Color(white: 1.0)
  public let secondaryBackground = Color(white: 0.98)
  public let surface = Color(white: 1.0)
  public let onSurface = Color(white: 0.0)
  public let text = Color(white: 0.0)
  public let secondaryText = Color(white: 0.4)
  public let separator = Color(white: 0.9)
  
  public let success = DSColors.Core.green500
  public let warning = DSColors.Core.yellow500
  public let error = DSColors.Core.red500
  
  public init() {}
}

public struct DarkTheme: AppTheme {
  public let id = "dark"
  public let name = "Dark"
  
  public var primary = Color(red: 0.3, green: 0.5, blue: 1.0)
  public let secondary = DSColors.Core.purple500.opacity(0.9)
  public let background = Color(red: 0.05, green: 0.07, blue: 0.1)
  public let secondaryBackground = Color(red: 0.08, green: 0.1, blue: 0.15)
  public let surface = Color(red: 0.12, green: 0.14, blue: 0.2)
  public let onSurface = Color(white: 1.0)
  public let text = Color(white: 1.0)
  public let secondaryText = Color(white: 0.7)
  public let separator = Color(white: 0.25)
  
  public let success = DSColors.Core.green500
  public let warning = DSColors.Core.yellow500
  public let error = DSColors.Core.red500
  
  public init() {}
}

public struct BlackTheme: AppTheme {
  public let id = "black"
  public let name = "OLED Black"
  
  public var primary = Color(red: 0.3, green: 0.5, blue: 1.0)
  public let secondary = DSColors.Core.purple500.opacity(0.9)
  public let background = Color.black
  public let secondaryBackground = Color(white: 0.05)
  public let surface = Color(white: 0.1)
  public let onSurface = Color(white: 1.0)
  public let text = Color(white: 1.0)
  public let secondaryText = Color(white: 0.6)
  public let separator = Color(white: 0.2)
  
  public let success = DSColors.Core.green500
  public let warning = DSColors.Core.yellow500
  public let error = DSColors.Core.red500
  
  public init() {}
}
