//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

public struct DSNavBar: View {
  @Environment(\.appTheme) var theme
  let title: String
  let showBackButton: Bool
  let trailingItem: AnyView?
  let backAction: (() -> Void)?
  
  public init(
    title: String,
    showBackButton: Bool = true,
    trailingItem: AnyView? = nil,
    backAction: (() -> Void)? = nil
  ) {
    self.title = title
    self.showBackButton = showBackButton
    self.trailingItem = trailingItem
    self.backAction = backAction
  }
  
  public var body: some View {
    HStack(spacing: DSSpacing.md) {
      if showBackButton {
        Button(action: { backAction?() }) {
          Image(systemName: "chevron.left")
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(theme.primary)
            .padding(DSSpacing.xs)
            .background(theme.surface)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
      }
      
      Text(title)
        .font(DSTypography.h3)
        .foregroundColor(theme.text)
      
      Spacer()
      
      if let trailingItem = trailingItem {
        trailingItem
      }
    }
    .padding(.horizontal, DSSpacing.md)
    .padding(.vertical, DSSpacing.sm)
    .background(theme.background.opacity(0.9))
  }
}
