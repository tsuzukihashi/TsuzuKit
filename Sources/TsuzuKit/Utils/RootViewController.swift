import UIKit

public var rootVC: UIViewController? {
  guard
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
    let rootVC = windowScene.windows.first?.rootViewController
  else { return nil }
  return rootVC
}
