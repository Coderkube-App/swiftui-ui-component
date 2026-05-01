import SwiftUI

public struct DSSkeleton: View {
  @State private var phase: CGFloat = 0
  
  public init() {}
  
  public var body: some View {
    GeometryReader { geo in
      ZStack {
        Color(UIColor.systemGray5)
        
        LinearGradient(
          gradient: Gradient(colors: [.clear, .white.opacity(0.5), .clear]),
          startPoint: .leading,
          endPoint: .trailing
        )
        .frame(width: geo.size.width * 2)
        .offset(x: -geo.size.width + (geo.size.width * 2 * phase))
      }
    }
    .mask(RoundedRectangle(cornerRadius: DSRadius.sm))
    .onAppear {
      withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
        phase = 1
      }
    }
  }
}
