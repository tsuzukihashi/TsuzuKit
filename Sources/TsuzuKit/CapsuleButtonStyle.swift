import SwiftUI

public struct CapsuleButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.body.bold())
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .background(
                Capsule()
                    .fill(colorScheme == .dark ? .white : .black)
            )
    }
}

public extension ButtonStyle where Self == CapsuleButtonStyle {
    static var capsule: Self {
        return .init()
    }
}
