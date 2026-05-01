import SwiftUI

public class ThemeManager: ObservableObject {
  @Published public var currentTheme: AppTheme
  private var customPrimaryColor: Color?
  
  public init(initialTheme: AppTheme = LightTheme()) {
    self.currentTheme = initialTheme
  }
  
  public func setTheme(_ theme: AppTheme) {
    var newTheme = theme
    if let customColor = customPrimaryColor {
      newTheme.primary = customColor
    }
    withAnimation(.easeInOut) {
      currentTheme = newTheme
    }
  }
  
  public func updatePrimaryColor(_ color: Color) {
    customPrimaryColor = color
    currentTheme.primary = color
    objectWillChange.send()
  }
}
