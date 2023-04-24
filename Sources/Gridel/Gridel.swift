import UIKit

public struct Gridel {
//    private var window: UIWindow?

    static var configStyle: ConfigStyle = .simple(configuration: SimpleConfiguration(width: 8, height: 8))

    static var trigger = Triggers.shake

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

    public static func configure(with activationAction: ActivationAction) {
        self.trigger = activationAction.mapToTrigger

        trigger.subscribe {
            window?.rootViewController?.present(SettingsViewController(), animated: true)
        }
    }

}

public enum ActivationAction {
    case shake

    var mapToTrigger: Trigger {
        switch self {
        case .shake:
            return Triggers.shake
        }
    }
}

public enum ConfigStyle {
    case simple(configuration: SimpleConfiguration)
    case verbose(configuration: VerboseConfiguration)
}

public struct SimpleConfiguration {
    let width: Int
    let height: Int
}

public struct VerboseConfiguration {
    let colorPrimary: UIColor
    let colorSecondary: UIColor
    let colorFill: UIColor // = .white
    let opacity: Double

    let marginSize: Int
    let columnCount: Int
    let gutterSize: Int // razmak izmedju stupaca
}


//public static func applyGrid() {
//    guard let window else { return }
//
//    switch configStyle {
//    case .simple:
//        window.rootViewController?.view.backgroundColor = .green
//    case .verbose:
//        window.rootViewController?.view.backgroundColor = .orange
//    }
//
//}
