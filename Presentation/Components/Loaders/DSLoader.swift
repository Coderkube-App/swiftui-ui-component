import SwiftUI

public struct DSLoader: View {
    @Environment(\.appTheme) var theme
    public enum Style {
        case circular
        case linear
    }
    
    let style: Style
    let color: Color?
    
    public init(style: Style = .circular, color: Color? = nil) {
        self.style = style
        self.color = color
    }
    
    public var body: some View {
        Group {
            switch style {
            case .circular:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: color ?? theme.primary))
            case .linear:
                ProgressView()
                    .progressViewStyle(LinearProgressViewStyle(tint: color ?? theme.primary))
            }
        }
    }
}

public struct DSActivityIndicator: View {
    @State private var isAnimating: Bool = false
    @Environment(\.appTheme) var theme
    
    public init() {}
    
    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(theme.primary, lineWidth: 3)
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
    }
}
