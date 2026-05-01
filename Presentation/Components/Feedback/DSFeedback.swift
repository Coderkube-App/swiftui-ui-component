import SwiftUI

public struct DSToast: View {
    @Environment(\.appTheme) var theme
    let message: String
    let style: ToastStyle
    
    public enum ToastStyle {
        case success, error, info
        
        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .error: return "xmark.circle.fill"
            case .info: return "info.circle.fill"
            }
        }
        
        func color(theme: AppTheme) -> Color {
            switch self {
            case .success: return theme.success
            case .error: return theme.error
            case .info: return theme.primary
            }
        }
    }
    
    public init(_ message: String, style: ToastStyle = .info) {
        self.message = message
        self.style = style
    }
    
    public var body: some View {
        HStack(spacing: DSSpacing.sm) {
            Image(systemName: style.icon)
                .foregroundColor(style.color(theme: theme))
            Text(message)
                .font(DSTypography.callout)
                .foregroundColor(theme.text)
        }
        .padding(.horizontal, DSSpacing.md)
        .padding(.vertical, DSSpacing.sm)
        .background(theme.surface)
        .cornerRadius(DSRadius.full)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

public struct DSBanner: View {
    @Environment(\.appTheme) var theme
    let title: String
    let message: String?
    let style: BannerStyle
    
    public enum BannerStyle {
        case info, warning, error
        
        func color(theme: AppTheme) -> Color {
            switch self {
            case .info: return theme.primary
            case .warning: return theme.warning
            case .error: return theme.error
            }
        }
    }
    
    public init(_ title: String, message: String? = nil, style: BannerStyle = .info) {
        self.title = title
        self.message = message
        self.style = style
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: DSSpacing.md) {
            Rectangle()
                .fill(style.color(theme: theme))
                .frame(width: 4)
            
            VStack(alignment: .leading, spacing: DSSpacing.xxs) {
                Text(title)
                    .font(DSTypography.bodyBold)
                    .foregroundColor(theme.text)
                if let message = message {
                    Text(message)
                        .font(DSTypography.caption)
                        .foregroundColor(theme.secondaryText)
                }
            }
            .padding(.vertical, DSSpacing.sm)
            
            Spacer()
        }
        .background(theme.surface)
        .cornerRadius(DSRadius.md)
        .overlay(
            RoundedRectangle(cornerRadius: DSRadius.md)
                .stroke(theme.separator, lineWidth: 1)
        )
    }
}
