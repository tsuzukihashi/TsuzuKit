import SwiftUI

public struct CapsuleButtonStyle: ButtonStyle {
    private let fontColor: Color
    private let backgroundColor: Color
    private let font: Font

    init(fontColor: Color, backgroundColor: Color, font: Font) {
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.font = font
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(font)
            .foregroundColor(fontColor)
            .background(
                Capsule()
                    .fill(backgroundColor)
                    .scaleEffect(configuration.isPressed ? 1.05 : 1)
            )
            .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == CapsuleButtonStyle {
    static func capsule(fontColor: Color, backgroundColor: Color, font: Font = .body.bold()) -> Self {
        .init(fontColor: fontColor, backgroundColor: backgroundColor, font: font)
    }
}
