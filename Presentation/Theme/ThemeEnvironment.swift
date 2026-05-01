import SwiftUI

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: AppTheme = LightTheme()
}

extension EnvironmentValues {
    public var appTheme: AppTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

extension View {
    public func withTheme(_ theme: AppTheme) -> some View {
        self.environment(\.appTheme, theme)
            .background(theme.background)
            .foregroundColor(theme.text)
    }
    
    public func applyTheme() -> some View {
        modifier(ThemeModifier())
    }
}

private struct ThemeModifier: ViewModifier {
    @Environment(\.appTheme) var theme
    
    func body(content: Content) -> some View {
        content
            .background(theme.background)
            .foregroundColor(theme.text)
    }
}
