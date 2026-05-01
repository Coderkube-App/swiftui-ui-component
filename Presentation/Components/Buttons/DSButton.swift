import SwiftUI

public enum DSButtonStyle {
  case primary
  case secondary
  case ghost
  case danger
}

public enum DSButtonSize {
  case small
  case medium
  case large
  
  var verticalPadding: CGFloat {
    switch self {
    case .small: return DSSpacing.xxs
    case .medium: return DSSpacing.sm
    case .large: return DSSpacing.md
    }
  }
  
  var horizontalPadding: CGFloat {
    switch self {
    case .small: return DSSpacing.md
    case .medium: return DSSpacing.lg
    case .large: return DSSpacing.xl
    }
  }
  
  var font: Font {
    switch self {
    case .small: return DSTypography.caption.weight(.semibold)
    case .medium: return DSTypography.callout.weight(.semibold)
    case .large: return DSTypography.bodyBold
    }
  }
}

public struct DSButton: View {
  @Environment(\.appTheme) var theme
  let title: String
  let style: DSButtonStyle
  let size: DSButtonSize
  let icon: String?
  let isLoading: Bool
  let isDisabled: Bool
  let isFullWidth: Bool
  let action: () -> Void
  
  public init(
    _ title: String,
    style: DSButtonStyle = .primary,
    size: DSButtonSize = .medium,
    icon: String? = nil,
    isLoading: Bool = false,
    isDisabled: Bool = false,
    isFullWidth: Bool = true,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.style = style
    self.size = size
    self.icon = icon
    self.isLoading = isLoading
    self.isDisabled = isDisabled
    self.isFullWidth = isFullWidth
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      HStack(spacing: DSSpacing.xs) {
        if isLoading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
            .scaleEffect(0.8)
        } else if let icon = icon {
          Image(systemName: icon)
        }
        
        if !isLoading {
          Text(title)
            .font(size.font)
        }
      }
      .padding(.horizontal, size.horizontalPadding)
      .padding(.vertical, size.verticalPadding)
      .frame(maxWidth: isFullWidth ? .infinity : nil)
      .background(backgroundView)
      .foregroundColor(foregroundColor)
      .cornerRadius(DSRadius.md)
      .overlay(
        RoundedRectangle(cornerRadius: DSRadius.md)
          .stroke(borderColor, lineWidth: 1)
      )
    }
    .disabled(isDisabled || isLoading)
    .buttonStyle(DSScaleButtonStyle())
    .opacity(isDisabled ? 0.5 : 1.0)
  }
  
  @ViewBuilder
  private var backgroundView: some View {
    switch style {
    case .primary:
      theme.primary
    case .secondary:
      theme.secondary.opacity(0.1)
    case .ghost:
      Color.clear
    case .danger:
      theme.error
    }
  }
  
  private var foregroundColor: Color {
    switch style {
    case .primary:
      return theme.primary.onColor()
    case .danger:
      return theme.error.onColor()
    case .secondary, .ghost:
      return theme.primary
    }
  }
  
  private var borderColor: Color {
    switch style {
    case .ghost:
      return theme.separator
    default:
      return .clear
    }
  }
}

struct DSScaleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
      .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
  }
}
