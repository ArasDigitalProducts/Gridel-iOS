import UIKit

public struct Gridel {
//    public private(set) var text = "Hello, World!"

//    private var window: UIWindow?

    public static var configStyle: ConfigStyle = .simple

    public init() {

    }

    public static func configure(style: ConfigStyle) {
        configStyle = style
    }

    public static func applyGrid() {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }

        switch configStyle {
        case .simple:
            keyWindow.window?.rootViewController?.view.backgroundColor = .green
        case .verbose:
            keyWindow.window?.rootViewController?.view.backgroundColor = .orange
        }

    }




}

public enum ConfigStyle {
    case simple
    case verbose
}
