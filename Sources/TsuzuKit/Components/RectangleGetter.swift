import SwiftUI

public struct RectangleGetter: View {
  @Binding var rect: CGRect

  public init(rect: Binding<CGRect>) {
    self._rect = rect
  }

  public var body: some View {
    GeometryReader { geometry in
      createView(proxy: geometry)
    }
  }

  @MainActor
  public func createView(proxy: GeometryProxy) -> some View {
    rect = proxy.frame(in: .global)
    return Rectangle()
      .fill(Color.clear)
  }
}
