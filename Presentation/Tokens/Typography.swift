import SwiftUI

public enum DSTypography {
  // MARK: - Headings
  public static let h1 = Font.system(.largeTitle, design: .rounded).bold()
  public static let h2 = Font.system(.title, design: .rounded).bold()
  public static let h3 = Font.system(.title2, design: .rounded).weight(.semibold)
  
  // MARK: - Body
  public static let body = Font.system(.body, design: .default)
  public static let bodyBold = Font.system(.body, design: .default).weight(.semibold)
  public static let callout = Font.system(.callout, design: .default).weight(.medium)
  
  // MARK: - Small Text
  public static let subheadline = Font.system(.subheadline, design: .default)
  public static let caption = Font.system(.caption, design: .default)
  public static let caption2 = Font.system(.caption2, design: .default)
}
