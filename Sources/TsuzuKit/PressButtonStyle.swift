import SwiftUI

struct PressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PressButtonStyle {
    static var squemo: Self {
        return .init()
    }
}
