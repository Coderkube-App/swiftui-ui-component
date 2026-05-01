import SwiftUI

public struct DSGlassCard<Content: View>: View {
    @Environment(\.appTheme) var theme
    let content: Content
    let padding: CGFloat
    
    public init(
        padding: CGFloat = DSSpacing.md,
        @ViewBuilder content: () -> Content
    ) {
        self.padding = padding
        self.content = content()
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .padding(padding)
        .background(
            ZStack {
                VisualEffectView(UIBlurEffect(style: .systemThinMaterial))
                theme.surface.opacity(theme.id == "dark" ? 0.3 : 0.6)
            }
        )
        .cornerRadius(DSRadius.lg)
        .overlay(
            RoundedRectangle(cornerRadius: DSRadius.lg)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 10,
            x: 0,
            y: 4
        )
    }
}
