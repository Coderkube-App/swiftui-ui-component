import UIKit

public enum AppIcon: String, CaseIterable {
  case primary = "AppIcon"
  case dark = "AppIcon-Dark"
  case vibrant = "AppIcon-Vibrant"
  
  public var displayName: String {
    switch self {
    case .primary: return "Default"
    case .dark: return "Dark Mode"
    case .vibrant: return "Vibrant"
    }
  }
}

public class AppIconManager {
  public static let shared = AppIconManager()
  private var isProcessing = false
  
  public var currentIcon: AppIcon {
    if let iconName = UIApplication.shared.alternateIconName {
      return AppIcon(rawValue: iconName) ?? .primary
    }
    return .primary
  }
  
  public func changeIcon(to icon: AppIcon) {
    guard !isProcessing else { return }
    
    let iconName = icon == .primary ? nil : icon.rawValue
    
    guard UIApplication.shared.supportsAlternateIcons else {
      print("Alternate icons not supported")
      return
    }
    
    if currentIcon == icon { return }
    
    isProcessing = true
    
    UIApplication.shared.setAlternateIconName(iconName) { [weak self] error in
      DispatchQueue.main.async {
        self?.isProcessing = false
        if let error = error {
          print("Error changing app icon: \(error.localizedDescription)")
        } else {
          print("Successfully changed app icon to: \(icon.displayName)")
        }
      }
    }
  }
}
