//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

public struct DSCard<Content: View>: View {
  @Environment(\.appTheme) var theme
  let content: Content
  let padding: CGFloat
  let cornerRadius: CGFloat
  let showShadow: Bool
  let showBorder: Bool
  
  public init(
    padding: CGFloat = DSSpacing.md,
    cornerRadius: CGFloat = DSRadius.lg,
    showShadow: Bool = true,
    showBorder: Bool = false,
    @ViewBuilder content: () -> Content
  ) {
    self.padding = padding
    self.cornerRadius = cornerRadius
    self.showShadow = showShadow
    self.showBorder = showBorder
    self.content = content()
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      content
    }
    .padding(padding)
    .background(theme.surface)
    .cornerRadius(cornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: cornerRadius)
        .stroke(theme.separator, lineWidth: showBorder ? 1 : 0)
    )
    .shadow(
      color: showShadow ? Color.black.opacity(0.05) : .clear,
      radius: 10,
      x: 0,
      y: 4
    )
  }
}
