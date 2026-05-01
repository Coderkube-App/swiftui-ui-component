import SwiftUI

public struct DSBadge: View {
    @Environment(\.appTheme) var theme
    let text: String
    let style: DSBadgeStyle
    
    public enum DSBadgeStyle {
        case primary, success, warning, error, neutral
        
        func color(theme: AppTheme) -> Color {
            switch self {
            case .primary: return theme.primary
            case .success: return theme.success
            case .warning: return theme.warning
            case .error: return theme.error
            case .neutral: return theme.secondaryText
            }
        }
    }
    
    public init(_ text: String, style: DSBadgeStyle = .primary) {
        self.text = text
        self.style = style
    }
    
    public var body: some View {
        Text(text)
            .font(DSTypography.caption.weight(.bold))
            .padding(.horizontal, DSSpacing.xs)
            .padding(.vertical, DSSpacing.xxxs)
            .background(style.color(theme: theme).opacity(0.1))
            .foregroundColor(style.color(theme: theme))
            .cornerRadius(DSRadius.sm)
    }
}

public struct DSAvatar: View {
    @Environment(\.appTheme) var theme
    let image: Image?
    let initials: String?
    let size: CGFloat
    
    public init(image: Image? = nil, initials: String? = nil, size: CGFloat = 40) {
        self.image = image
        self.initials = initials
        self.size = size
    }
    
    public var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Circle()
                    .fill(theme.secondary.opacity(0.1))
                if let initials = initials {
                    Text(initials)
                        .font(.system(size: size * 0.4, weight: .bold))
                        .foregroundColor(theme.primary)
                }
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(Circle().stroke(theme.separator, lineWidth: 1))
    }
}
