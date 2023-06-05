import SwiftUI

public struct PageControllView: UIViewRepresentable {
  @Binding var currentPage: Int
  var numberOfPages: Int = 0

  public init(currentPage: Binding<Int>, numberOfPages: Int) {
    self._currentPage = currentPage
    self.numberOfPages = numberOfPages
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  public func makeUIView(context: Context) -> UIPageControl {
    let pageControl = UIPageControl()
    pageControl.currentPageIndicatorTintColor = .label
    pageControl.numberOfPages = numberOfPages
    pageControl.pageIndicatorTintColor = .secondaryLabel
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
