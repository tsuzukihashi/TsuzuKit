import SwiftUI

public struct PressButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == PressButtonStyle {
    static var press: Self {
        return .init()
    }
}
