/// https://qiita.com/chocoyama/items/1cb7040f0e717406a6f4
/// Useage
/// .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])

import SwiftUI

public struct PartlyRoundedCornerView: UIViewRepresentable {
  let cornerRadius: CGFloat
  let maskedCorners: CACornerMask

  public func makeUIView(context: UIViewRepresentableContext<PartlyRoundedCornerView>) -> UIView {
    let uiView = UIView()
    uiView.layer.cornerRadius = cornerRadius
    uiView.layer.maskedCorners = maskedCorners
    uiView.backgroundColor = .white
    return uiView
  }

  public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PartlyRoundedCornerView>) {
  }
}

public struct PartlyRoundedCornerModifier: ViewModifier {
  let cornerRadius: CGFloat
  let maskedCorners: CACornerMask

  public func body(content: Content) -> some View {
    content.mask(PartlyRoundedCornerView(cornerRadius: self.cornerRadius, maskedCorners: self.maskedCorners))
  }
}

extension View {
  public func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> some View {
    self.modifier(PartlyRoundedCornerModifier(cornerRadius: radius, maskedCorners: maskedCorners))
  }
}
