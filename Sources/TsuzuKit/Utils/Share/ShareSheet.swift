import Foundation
import SwiftUI

public struct ShareSheet: UIViewControllerRepresentable {
  let image: UIImage?
  let text: String

  public init(image: UIImage?, text: String) {
    self.image = image
    self.text = text
  }

  public func makeUIViewController(context: Context) -> UIActivityViewController {
    let itemSource = ShareActivityItemSource(shareText: text, shareImage: image)
    var activityItems: [Any] = [text, itemSource]
    if let image {
      activityItems.append(image)
    }
    let controller = UIActivityViewController(
      activityItems: activityItems,
      applicationActivities: nil
    )

    return controller
  }

  public func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
  }
}
