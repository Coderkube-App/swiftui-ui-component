# SwiftUI Design System

A clean, scalable, and user-friendly UI architecture for SwiftUI.

## Architecture

The project is structured into modular layers:
- **Tokens**: The source of truth for visual constants (Colors, Typography, Spacing, Radius, Shadows).
- **Theme**: A flexible theming engine supporting dynamic Light and Dark modes.
- **Components**: A library of reusable, configurable UI elements.
- **Layout**: Utilities for responsive and adaptive designs.

## Core Tokens

### Colors
We use a semantic color palette. Use theme-aware colors like `theme.primary`, `theme.background`, and `theme.text` to ensure compatibility with Light/Dark modes.

### Typography
Our typography system supports Dynamic Type out of the box. Styles include `h1`, `h2`, `h3`, `body`, `callout`, and `caption`.

### Spacing
Spacing follows a consistent scale:
- `xxxs`: 2pt
- `xxs`: 4pt
- `xs`: 8pt
- `sm`: 12pt
- `md`: 16pt
- `lg`: 24pt
- `xl`: 32pt
- `xxl`: 48pt

## Components

### DSButton
Highly configurable buttons with support for:
- **Styles**: `.primary`, `.secondary`, `.ghost`, `.danger`
- **Sizes**: `.small`, `.medium`, `.large`
- **States**: Loading, Disabled
- **Icons**: SFSymbols support

### DSTextField
Custom text fields with:
- Labels and Error messages
- Focus state highlighting
- Clear buttons
- Secure entry support

### DSCard
A versatile container for grouping content with consistent padding and shadows.

### DSLoader & DSSkeleton
Visual feedback for loading states, including circular/linear progress and shimmering skeleton screens.

## Usage Guide

### Injecting the Theme
Wrap your root view with the `ThemeManager` and apply the theme environment:

```swift
@main
struct MyApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .withTheme(themeManager.currentTheme)
        }
    }
}
```

### Using Components
```swift
DSButton("Get Started") {
    print("Action clicked")
}
```
