import SwiftUI

/**
 
 */
public struct SnapCarousel<Content: View, T: Identifiable>: View {
  var content: (T) -> Content
  var items: [T]

  // property
  var spacing: CGFloat
  var trailingSpace: CGFloat
  var swipeThreshold: CGFloat

  @Binding var index: Int

  public init(
    spacing: CGFloat = 16,
    trailingSpace: CGFloat = 100,
    swipeThreshold: CGFloat = 100,
    index: Binding<Int>,
    items: [T],
    @ViewBuilder content: @escaping (T) -> Content
  ) {
    self.spacing = spacing
    self.trailingSpace = trailingSpace
    self.swipeThreshold = swipeThreshold
    self._index = index
    self.items = items
    self.content = content
  }

  @GestureState var offset: CGFloat = 0
  @State var currentIndex: Int = 0
  @State var isScroll: Bool = false

  public var body: some View {
    GeometryReader { proxy in
      let width = proxy.size.width - (trailingSpace - spacing)
      let adjustMentWidth = (trailingSpace / 2) - spacing

      HStack(spacing: spacing) {
        ForEach(items) { item in
          content(item)
            .frame(width: proxy.size.width - trailingSpace)
        }
      }
      .padding(.horizontal, spacing)
      .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0)  + offset)
      .gesture(
        DragGesture()
          .updating($offset, body: { value, out, _ in
            out = value.translation.width
          })
          .onEnded({ value in
            let offsetX = value.translation.width
            let progress = -offsetX / width
            let roundIndex = progress.rounded()

            currentIndex = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
            currentIndex = index
            isScroll = false
          })
          .onChanged({ value in
            isScroll = true
            let offsetX = value.translation.width
            let progress = -offsetX / swipeThreshold
            let roundIndex: CGFloat

            if progress > 0 {
              roundIndex = min(progress.rounded(), 0)
            } else {
              roundIndex = max(progress.rounded(), 0)
            }

            index = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
          })
      )
    }
    .onChange(of: index, perform: { value in
      if !isScroll {
        currentIndex = value
      }
    })
    .animation(.easeInOut, value: offset == 0)
    .animation(.easeInOut, value: currentIndex)
  }
}
