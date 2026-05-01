import SwiftUI

public struct AdaptiveStack<Content: View>: View {
  @Environment(\.horizontalSizeClass) var sizeClass
  let spacing: CGFloat?
  let content: () -> Content
  
  public init(spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
    self.spacing = spacing
    self.content = content
  }
  
  public var body: some View {
    Group {
      if sizeClass == .compact {
        VStack(spacing: spacing, content: content)
      } else {
        HStack(spacing: spacing, content: content)
      }
    }
  }
}
