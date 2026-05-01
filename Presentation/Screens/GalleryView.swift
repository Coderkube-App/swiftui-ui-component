import SwiftUI
// Since this is in the same repo, we might need to import DesignSystem if it's a separate target.
// For now, I'll assume we are building the app within the same project.

struct GalleryView: View {
  @EnvironmentObject var themeManager: ThemeManager
  @State private var text: String = ""
  @State private var email: String = ""
  @State private var toggleOn: Bool = true
  @State private var checkboxOn: Bool = false
  @State private var radioSelection: Int = 1
  @State private var sliderValue: Double = 0.5
  @State private var segmentedSelection: Int = 0
  
  var body: some View {
    NavigationView {
      ResponsiveView { horizontalSizeClass, _ in
        ScrollView {
          VStack(alignment: .leading, spacing: DSSpacing.xl) {
            // Theme Engine
            sectionHeader("Theme Engine")
            DSCard {
              VStack(alignment: .leading, spacing: DSSpacing.md) {
                HStack(spacing: DSSpacing.md) {
                  DSButton("Light", style: themeManager.currentTheme.id == "light" ? .primary : .secondary, size: .small, isFullWidth: false) {
                    themeManager.setTheme(LightTheme())
                  }
                  DSButton("Dark", style: themeManager.currentTheme.id == "dark" ? .primary : .secondary, size: .small, isFullWidth: false) {
                    themeManager.setTheme(DarkTheme())
                  }
                  DSButton("Black", style: themeManager.currentTheme.id == "black" ? .primary : .secondary, size: .small, isFullWidth: false) {
                    themeManager.setTheme(BlackTheme())
                  }
                }
                
                Divider()
                
                HStack {
                  Text("Brand Color").font(DSTypography.bodyBold)
                  Spacer()
                  ColorPicker("", selection: Binding(
                    get: { themeManager.currentTheme.primary },
                    set: { themeManager.updatePrimaryColor($0) }
                  ))
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: DSSpacing.sm) {
                  Text("App Icon").font(DSTypography.bodyBold)
                  HStack(spacing: DSSpacing.md) {
                    ForEach(AppIcon.allCases, id: \.self) { icon in
                      Button(action: { AppIconManager.shared.changeIcon(to: icon) }) {
                        VStack {
                          RoundedRectangle(cornerRadius: 12)
                            .fill(iconColor(for: icon))
                            .frame(width: 50, height: 50)
                            .overlay(
                              Image(systemName: "app.fill")
                                .foregroundColor(.white)
                            )
                          Text(icon.displayName)
                            .font(DSTypography.caption2)
                            .foregroundColor(themeManager.currentTheme.text)
                        }
                      }
                    }
                  }
                }
              }
            }
            
            let columns = horizontalSizeClass == .regular ? 
              [GridItem(.flexible(), spacing: DSSpacing.lg), GridItem(.flexible(), spacing: DSSpacing.lg)] : 
              [GridItem(.flexible())]
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: DSSpacing.lg) {
              // Controls
              VStack(alignment: .leading, spacing: DSSpacing.md) {
                sectionHeader("Controls")
                DSCard {
                  VStack(alignment: .leading, spacing: DSSpacing.md) {
                    DSToggle("Notifications", isOn: $toggleOn)
                    Divider()
                    DSCheckbox("I agree to terms", isOn: $checkboxOn)
                    Divider()
                    HStack(spacing: DSSpacing.lg) {
                      DSRadioButton("Option 1", isSelected: radioSelection == 1) { radioSelection = 1 }
                      DSRadioButton("Option 2", isSelected: radioSelection == 2) { radioSelection = 2 }
                    }
                    Divider()
                    DSSlider(value: $sliderValue)
                    DSSegmentedControl(selection: $segmentedSelection, items: [0, 1, 2], label: { "Tab \($0 + 1)" })
                  }
                }
              }
              
              // Indicators & Feedback
              VStack(alignment: .leading, spacing: DSSpacing.md) {
                sectionHeader("Indicators & Feedback")
                DSCard {
                  VStack(alignment: .leading, spacing: DSSpacing.md) {
                    HStack(spacing: DSSpacing.md) {
                      DSAvatar(initials: "JD", size: 50)
                      VStack(alignment: .leading) {
                        Text("John Doe").font(DSTypography.bodyBold)
                        HStack {
                          DSBadge("Pro", style: .primary)
                          DSBadge("Verified", style: .success)
                        }
                      }
                    }
                    Divider()
                    DSToast("Message sent successfully!", style: .success)
                    DSBanner("System Update", message: "A new version of the design system is available.", style: .info)
                  }
                }
              }
              
              // Buttons
              VStack(alignment: .leading, spacing: DSSpacing.md) {
                sectionHeader("Buttons")
                DSCard {
                  VStack(spacing: DSSpacing.md) {
                    HStack(spacing: DSSpacing.md) {
                      DSButton("Primary", style: .primary) {}
                      DSButton("Danger", style: .danger) {}
                    }
                    DSButton("Secondary Small", style: .secondary, size: .small) {}
                    DSButton("Ghost Loading", style: .ghost, isLoading: true) {}
                  }
                }
              }
              
              // Inputs
              VStack(alignment: .leading, spacing: DSSpacing.md) {
                sectionHeader("Inputs")
                DSCard {
                  VStack(spacing: DSSpacing.md) {
                    DSTextField("Username", text: $text, label: "Username", icon: "person")
                    DSTextField("Email", text: $email, label: "Email", icon: "envelope", keyboardType: .emailAddress, autocapitalization: .never)
                  }
                }
              }
            }
            
            // Layout Showcase
            sectionHeader("Visual Components")
            HStack(spacing: DSSpacing.lg) {
                DSGlassCard {
                    VStack(alignment: .leading, spacing: DSSpacing.sm) {
                        Text("Glass Card").font(DSTypography.h3)
                        Text("Responsive blur effect").font(DSTypography.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                DSCard(showBorder: true) {
                    VStack(alignment: .leading, spacing: DSSpacing.sm) {
                        Text("Bordered Card").font(DSTypography.h3)
                        Text("Clean and minimal").font(DSTypography.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
          }
          .padding(horizontalSizeClass == .regular ? DSSpacing.xl : DSSpacing.md)
        }
      }
      .navigationTitle("Design System")
      .applyTheme()
      .withTheme(themeManager.currentTheme)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
  
  private func sectionHeader(_ title: String) -> some View {
    Text(title)
      .font(DSTypography.h2)
      .foregroundColor(themeManager.currentTheme.text)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.top, DSSpacing.md)
  }
  
  private func iconColor(for icon: AppIcon) -> Color {
      switch icon {
      case .primary: return .blue
      case .dark: return .black
      case .vibrant: return .orange
      }
  }
}
