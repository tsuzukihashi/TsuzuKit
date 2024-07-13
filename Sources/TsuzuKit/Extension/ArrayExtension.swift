import Foundation

public extension Array {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

public extension RandomAccessCollection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(enumerated())
  }
}
