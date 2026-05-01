import SwiftUI

public struct VisualEffectView: UIViewRepresentable {
    public var effect: UIVisualEffect?
    public init(_ effect: UIVisualEffect?) {
        self.effect = effect
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

extension View {
    public func blurBackground(style: UIBlurEffect.Style = .systemThinMaterial) -> some View {
        self.background(VisualEffectView(UIBlurEffect(style: style)))
    }
}
