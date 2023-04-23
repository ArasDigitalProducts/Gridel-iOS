import UIKit

public struct Gridel {
//    public private(set) var text = "Hello, World!"

//    private var window: UIWindow?

    static var configStyle: ConfigStyle = .simple

    static var window: UIWindow? {
            guard let scene = UIApplication.shared.connectedScenes.first,
                  let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
                  let window = windowSceneDelegate.window else {
                return nil
            }
            return window
        }

    public init() {

    }

    public static func configure(style: ConfigStyle) {
        configStyle = style
    }

    public static func applyGrid() {
        guard let window else { return }

        switch configStyle {
        case .simple:
            window.rootViewController?.view.backgroundColor = .green
        case .verbose:
            window.rootViewController?.view.backgroundColor = .orange
        }

    }

}

public enum ConfigStyle {
    case simple
    case verbose
}
