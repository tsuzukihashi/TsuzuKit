import Foundation
import SwiftUI

public struct ShareSheet: UIViewControllerRepresentable {
  private let image: UIImage?
  private let title: String
  private let description: String?

  public init(
    title: String,
    image: UIImage?,
    description: String?
  ) {
    self.title = title
    self.image = image
    self.description = description
  }

  public func makeUIViewController(context: Context) -> UIActivityViewController {
    let itemSource = ShareActivityItemSource(
      title: title
    )
    var activityItems: [Any] = [itemSource]
    if let image {
      activityItems.append(image)
    }
    if let description {
      activityItems.append(description)
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
