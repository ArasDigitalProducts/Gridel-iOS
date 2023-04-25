import UIKit

public struct Gridel {
    static var window: UIWindow? {
            guard let scene = UIApplication.shared.connectedScenes.first,
                  let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
                  let window = windowSceneDelegate.window else {
                return nil
            }
            return window
        }

    static var gridView = GridView()

    static var configStyle: ConfigStyle?

    static var trigger = Triggers.shake

    static var isGridActive = false

    public init() {
    }

    public static func configure(with activationAction: ActivationAction) {
        self.trigger = activationAction.mapToTrigger

        trigger.subscribe {
            if isGridActive {
                removeGrid()
            } else {
                window?.rootViewController?.present(SettingsViewController(), animated: true)
            }
        }
    }

    static func applyGrid(with configStyle: ConfigStyle) {

        guard let window else { return }

        gridView = GridView()
        gridView.frame = window.bounds
        gridView.setup(with: configStyle)

        gridView.isUserInteractionEnabled = false
        window.addSubview(gridView)

        print("applied \(configStyle)")
        isGridActive = true
    }

    static func removeGrid() {
        gridView.removeFromSuperview()
        print("removed grid")
        isGridActive = false
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
    let opacity: Float
    let colorPrimary: UIColor
    let colorSpacing: UIColor
}

public struct VerboseConfiguration {
    let colorPrimary: UIColor
    let colorSecondary: UIColor
    let colorSpacing: UIColor
    let opacity: Float

    let marginSize: Int
    let columnCount: Int
    let gutterSize: Int // razmak izmedju stupaca

    let rowHeight: Int
    let rowSpacing: Int
}
