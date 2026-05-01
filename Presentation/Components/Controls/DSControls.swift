//
// Copyright (c) 2026 Coderkube Technologies - SwiftUI-DesignSystem. All rights reserved.
//

import SwiftUI

public struct DSToggle: View {
  @Environment(\.appTheme) var theme
  let label: String
  @Binding var isOn: Bool
  
  public init(_ label: String, isOn: Binding<Bool>) {
    self.label = label
    self._isOn = isOn
  }
  
  public var body: some View {
    Toggle(label, isOn: $isOn)
      .toggleStyle(SwitchToggleStyle(tint: theme.primary))
      .font(DSTypography.body)
      .foregroundColor(theme.text)
  }
}

public struct DSSegmentedControl<Selection: Hashable>: View {
  @Environment(\.appTheme) var theme
  @Binding var selection: Selection
  let items: [Selection]
  let label: (Selection) -> String
  
  public init(selection: Binding<Selection>, items: [Selection], label: @escaping (Selection) -> String) {
    self._selection = selection
    self.items = items
    self.label = label
  }
  
  public var body: some View {
    Picker("", selection: $selection) {
      ForEach(items, id: \.self) { item in
        Text(label(item)).tag(item)
      }
    }
    .pickerStyle(SegmentedPickerStyle())
  }
}

public struct DSSlider: View {
  @Environment(\.appTheme) var theme
  @Binding var value: Double
  let range: ClosedRange<Double>
  let step: Double
  
  public init(value: Binding<Double>, in range: ClosedRange<Double> = 0...1, step: Double = 0.1) {
    self._value = value
    self.range = range
    self.step = step
  }
  
  public var body: some View {
    Slider(value: $value, in: range, step: step)
      .accentColor(theme.primary)
  }
}

public struct DSCheckbox: View {
  @Environment(\.appTheme) var theme
  let label: String
  @Binding var isOn: Bool
  
  public init(_ label: String, isOn: Binding<Bool>) {
    self.label = label
    self._isOn = isOn
  }
  
  public var body: some View {
    Button(action: { isOn.toggle() }) {
      HStack(spacing: DSSpacing.sm) {
        Image(systemName: isOn ? "checkmark.square.fill" : "square")
          .foregroundColor(isOn ? theme.primary : theme.secondaryText)
          .font(.system(size: 20))
        Text(label)
          .font(DSTypography.body)
          .foregroundColor(theme.text)
      }
    }
    .buttonStyle(PlainButtonStyle())
  }
}

public struct DSRadioButton: View {
  @Environment(\.appTheme) var theme
  let label: String
  let isSelected: Bool
  let action: () -> Void
  
  public init(_ label: String, isSelected: Bool, action: @escaping () -> Void) {
    self.label = label
    self.isSelected = isSelected
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      HStack(spacing: DSSpacing.sm) {
        Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
          .foregroundColor(isSelected ? theme.primary : theme.secondaryText)
          .font(.system(size: 20))
        Text(label)
          .font(DSTypography.body)
          .foregroundColor(theme.text)
      }
    }
    .buttonStyle(PlainButtonStyle())
  }
}
