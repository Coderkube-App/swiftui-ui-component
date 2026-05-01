import SwiftUI

public enum DeviceType {
  case iPhone, iPad, mac
}

public struct ResponsiveLayout {
  public static var device: DeviceType {
#if os(macOS)
    return .mac
#else
    if UIDevice.current.userInterfaceIdiom == .pad {
      return .iPad
    } else {
      return .iPhone
    }
#endif
  }
  
  public static var isIPad: Bool { device == .iPad }
}

public struct ResponsiveView<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    let content: (UserInterfaceSizeClass?, UserInterfaceSizeClass?) -> Content
    
    public init(@ViewBuilder content: @escaping (UserInterfaceSizeClass?, UserInterfaceSizeClass?) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content(horizontalSizeClass, verticalSizeClass)
    }
}
