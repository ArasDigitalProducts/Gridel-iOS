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
        switch configStyle {
        case .simple(let config):
            applySimpleGrid(with: config)
        case .verbose(let config):
            applyVerboseGrid(with: config)
        }
    }

    static func applySimpleGrid(with configuration: SimpleConfiguration) {

        guard let window else { return }

        let gridView = UIView(frame: window.bounds)
        gridView.backgroundColor = .lightGray
        gridView.layer.opacity = configuration.opacity
        gridView.isUserInteractionEnabled = false
        window.addSubview(gridView)

        print("applied \(configuration)")
        isGridActive = true
    }

    static func applyVerboseGrid(with configuration: VerboseConfiguration) {

        print("applied grid: \(configuration)")
        isGridActive = true
    }

    static func removeGrid() {

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
