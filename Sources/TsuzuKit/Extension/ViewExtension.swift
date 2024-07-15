import SwiftUI

public extension UIView {
  func getImage(rect: CGRect) -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: rect)
    return renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
  }
}

public extension View {
  @ViewBuilder
  func `if`<Content: View>(
    _ condition: Bool,
    @ViewBuilder transform: (Self) -> Content
  ) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }

  @ViewBuilder
  func `if`<TrueContent: View, FalseContent: View>(
    _ condition: Bool,
    @ViewBuilder _ then: (Self) -> TrueContent,
    @ViewBuilder `else`: (Self) -> FalseContent
  ) -> some View {
    if condition {
      then(self)
    } else {
      `else`(self)
    }
  }
}
