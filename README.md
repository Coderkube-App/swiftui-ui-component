# SwiftUI Design System Engine

This project serves as a production-ready, portfolio-grade **Design System Engine** for building iOS applications using **SwiftUI**. It provides a scalable foundation for visual consistency, theming, and modular UI development.

It heavily emphasizes "Design Tokens First" as the source of truth, establishing a robust architecture that separates design logic from component implementation.

## Architecture Overview

The system is structured into modular layers that follow a logical progression from visual primitives to complex UI layouts.

### 1. Design Tokens (The Source of Truth)
Contains the core visual constants that define the brand's identity.
- **Colors**: Semantic color palettes for backgrounds, text, and accents.
- **Typography**: Responsive font scales with Dynamic Type support.
- **Spacing & Layout**: Standardized scales for margins, padding, and grid alignment.
- **Radius & Shadows**: Consistent elevation and corner treatment across all components.

### 2. Theming Engine
A flexible system that handles real-time brand customization and environmental adaptations.
- **ThemeManager**: Orchestrates theme switching (Light, Dark, OLED).
- **AppTheme**: Defines the contract and concrete values for each theme variant.
- **Dynamic Icons**: Supports runtime app icon switching to match brand aesthetics.

### 3. Component Library
A collection of reusable, atomic UI elements built using the Design Tokens.
- **DSButton**: Highly configurable button system with support for multiple styles and states.
- **DSTextField**: Standardized input fields with validation and focus states.
- **DSCard & DSGlassCard**: Versatile containers for content grouping.
- **DSLoader & DSSkeleton**: Feedback mechanisms for asynchronous operations.

### 4. Layout & Responsiveness
Utilities for ensuring the UI adapts gracefully across different screen sizes and orientations.
- **AdaptiveStack**: Intelligently switches between horizontal and vertical layouts based on available space.
- **Responsive Views**: Logic for handling iPad-specific layouts and multi-orientation support.

## Folder Structure

```
SwiftUI-DesignSystem/
├── App/                  # App Entry Point & Lifecycle
├── Assets/               # Media, xcassets, and App Icon sets
├── Core/                 # Shared Extensions and low-level utilities
└── Presentation/
    ├── Tokens/           # Colors, Typography, Spacing, etc.
    ├── Theme/            # Theming logic and ThemeManager
    ├── Components/       # Reusable UI Elements (Buttons, Cards, etc.)
    ├── Layout/           # Adaptive and Responsive utilities
    ├── Navigation/       # Custom Navigation Bars and Routing
    └── Screens/          # Gallery and Demo screens
```

## Benefits of this System

1. **Brand Consistency**: Centralized tokens ensure that every component adheres to the same visual language.
2. **Speed of Development**: Pre-built, tested components allow teams to focus on business logic rather than UI implementation.
3. **Theming Flexibility**: Support for Light, Dark, and High-Contrast modes is baked into the foundation.
4. **Maintainability**: Global design changes (e.g., changing a primary color) can be made in a single token file and propagate throughout the app.

## Setup & Usage

This project utilizes [XcodeGen](https://github.com/yonaskolb/XcodeGen) to programmatically generate the `.xcodeproj` file.

### Prerequisites
1. Ensure XcodeGen is installed: `brew install xcodegen`

### Getting Started
1. Run `xcodegen generate` in the root directory.
2. Open `SwiftUI-DesignSystem.xcodeproj`.
3. Select the `DesignSystemDemo` scheme and run on a simulator.

### Usage Example

```swift
// Injecting the system into your App
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

// Using a component
DSButton("Get Started", style: .primary) {
    print("Action clicked")
}
```

## License 
This project is licensed under the Apache-2.0 License.

