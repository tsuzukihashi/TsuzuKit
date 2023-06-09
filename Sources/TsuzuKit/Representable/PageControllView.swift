import SwiftUI

#if canImport(UIKit)
public struct PageControllView: UIViewRepresentable {
  @Binding var currentPage: Int
  let numberOfPages: Int
  let pageIndicatorTintColor :UIColor
  let currentPageIndicatorTintColor :UIColor

  public init(
    currentPage: Binding<Int>,
    numberOfPages: Int,
    pageIndicatorTintColor: UIColor = .secondaryLabel,
    currentPageIndicatorTintColor: UIColor = .label
  ) {
    self._currentPage = currentPage
    self.numberOfPages = numberOfPages
    self.pageIndicatorTintColor = pageIndicatorTintColor
    self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  public func makeUIView(context: Context) -> UIPageControl {
    let pageControl = UIPageControl()
    pageControl.pageIndicatorTintColor = pageIndicatorTintColor
    pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
    pageControl.numberOfPages = numberOfPages
    pageControl.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged
    )
    return pageControl
  }

  public func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }

  public class Coordinator: NSObject {
    var pageControl: PageControllView

    init(_ pageControl: PageControllView) {
      self.pageControl = pageControl
    }

    @objc func updateCurrentPage(sender: UIPageControl) {
      pageControl.currentPage = sender.currentPage
    }
  }
}
#endif
