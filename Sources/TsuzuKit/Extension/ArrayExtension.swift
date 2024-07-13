import Foundation

extension Array {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

extension RandomAccessCollection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(enumerated())
  }
}
