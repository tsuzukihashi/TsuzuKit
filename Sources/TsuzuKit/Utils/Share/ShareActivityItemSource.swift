import Foundation
import LinkPresentation

public class ShareActivityItemSource: NSObject, UIActivityItemSource {
  private let title: String
  private let linkMetaData = LPLinkMetadata()

  public init(
    title: String
  ) {
    self.title = title
    linkMetaData.title = title
    super.init()
  }

  public func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
    return UIImage(named: "AppIcon") as Any
  }

  public func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
    return nil
  }

  public func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
    return linkMetaData
  }
}
