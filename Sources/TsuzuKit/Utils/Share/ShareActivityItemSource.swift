import Foundation
import LinkPresentation

public class ShareActivityItemSource: NSObject, UIActivityItemSource {
  var shareText: String
  var shareImage: UIImage
  var linkMetaData = LPLinkMetadata()

  public init(shareText: String, shareImage: UIImage) {
    self.shareText = shareText
    self.shareImage = shareImage
    linkMetaData.title = shareText
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
