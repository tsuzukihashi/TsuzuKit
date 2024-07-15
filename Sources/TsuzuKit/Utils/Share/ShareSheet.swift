import Foundation
import SwiftUI

public struct ShareSheet: UIViewControllerRepresentable {
  let image: UIImage
  let text: String

  public init(photo: UIImage, text: String) {
    self.image = photo
    self.text = text
  }

  public func makeUIViewController(context: Context) -> UIActivityViewController {
    let itemSource = ShareActivityItemSource(shareText: text, shareImage: image)
    let activityItems: [Any] = [image, text, itemSource]

    let controller = UIActivityViewController(
      activityItems: activityItems,
      applicationActivities: nil
    )

    return controller
  }

  public func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
  }
}
