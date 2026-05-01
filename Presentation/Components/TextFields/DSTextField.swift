import SwiftUI

public struct DSTextField: View {
  @Environment(\.appTheme) var theme
  let label: String?
  let placeholder: String
  @Binding var text: String
  let icon: String?
  let error: String?
  let isSecure: Bool
  let keyboardType: UIKeyboardType
  let autocapitalization: TextInputAutocapitalization
  
  @FocusState private var isFocused: Bool
  
  public init(
    _ placeholder: String,
    text: Binding<String>,
    label: String? = nil,
    icon: String? = nil,
    error: String? = nil,
    isSecure: Bool = false,
    keyboardType: UIKeyboardType = .default,
    autocapitalization: TextInputAutocapitalization = .sentences
  ) {
    self.placeholder = placeholder
    self._text = text
    self.label = label
    self.icon = icon
    self.error = error
    self.isSecure = isSecure
    self.keyboardType = keyboardType
    self.autocapitalization = autocapitalization
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: DSSpacing.xxs) {
      if let label = label {
        Text(label)
          .font(DSTypography.caption.weight(.medium))
          .foregroundColor(theme.secondaryText)
      }
      
      HStack(spacing: DSSpacing.sm) {
        if let icon = icon {
          Image(systemName: icon)
            .foregroundColor(iconColor)
        }
        
        Group {
          if isSecure {
            SecureField(placeholder, text: $text)
          } else {
            TextField(placeholder, text: $text)
              .keyboardType(keyboardType)
              .textInputAutocapitalization(autocapitalization)
          }
        }
        .font(DSTypography.body)
        .foregroundColor(theme.text)
        .focused($isFocused)
        
        if !text.isEmpty && !isSecure {
          Button(action: { text = "" }) {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(theme.secondaryText.opacity(0.5))
          }
        }
      }
      .padding(DSSpacing.md)
      .background(theme.surface)
      .cornerRadius(DSRadius.md)
      .overlay(
        RoundedRectangle(cornerRadius: DSRadius.md)
          .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
      )
      
      if let error = error {
        Text(error)
          .font(DSTypography.caption)
          .foregroundColor(theme.error)
          .transition(.opacity.combined(with: .move(edge: .top)))
      }
    }
    .animation(.easeInOut(duration: 0.2), value: isFocused)
    .animation(.easeInOut(duration: 0.2), value: error)
  }
  
  private var borderColor: Color {
    if error != nil {
      return theme.error
    }
    return isFocused ? theme.primary : theme.separator
  }
  
  private var iconColor: Color {
    if error != nil {
      return theme.error
    }
    return isFocused ? theme.primary : theme.secondaryText
  }
}
