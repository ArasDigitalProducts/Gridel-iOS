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

    public static var gridelWindow: UIWindow?

    static var gridViewRows = GridViewRows()
    static var gridViewColumns = GridViewColumns()

//    static var configStyle: ConfigStyle?

    static var trigger = Triggers.shake

    static var isGridActive = false

    public init() {
    }

    public static func configure(with activationAction: ActivationAction) {
        self.trigger = activationAction.mapToTrigger
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

        gridelWindow = UIWindow(windowScene: scene)
        gridelWindow?.windowLevel = UIWindow.Level.alert + 1
//        gridelWindow?.backgroundColor = .clear
        gridelWindow?.isHidden = false
        gridelWindow?.isUserInteractionEnabled = false
        let rootView = UIViewController()
        rootView.view.backgroundColor = .clear
        gridelWindow?.rootViewController = UINavigationController()

        trigger.subscribe {
            if isGridActive {
                removeGrid()
            } else {
                gridelWindow?.isUserInteractionEnabled = true
                gridelWindow?.rootViewController?.present(SettingsViewController(), animated: true)
            }
        }
    }

    static func applyGrid(with configStyle: ConfigStyle) {
        switch configStyle {
        case .simple(let configuration):
            applySimpleGrid(with: configuration)
        case .verbose(let configuration):
            applyVerboseGrid(with: configuration)
        }

        print("applied \(configStyle)")
        isGridActive = true
    }

    static func applySimpleGrid(with config: SimpleConfiguration) {
        guard let gridelWindow else { return }

        gridViewRows = GridViewRows()
        gridViewRows.frame = gridelWindow.bounds
        gridViewRows.setup(with: config)

        gridViewRows.isUserInteractionEnabled = false
        gridelWindow.addSubview(gridViewRows)
    }

    static func applyVerboseGrid(with config: VerboseConfiguration) {
        guard let gridelWindow else { return }

        gridViewRows = GridViewRows()
        gridViewRows.frame = gridelWindow.bounds
        gridViewRows.setup(with: config.toSimpleConfig)
        gridViewRows.isUserInteractionEnabled = false

        gridViewColumns = GridViewColumns()
        gridViewColumns.frame = gridelWindow.bounds
        gridViewColumns.setup(with: config)
        gridViewColumns.isUserInteractionEnabled = false

        gridelWindow.addSubview(gridViewRows)
        gridelWindow.addSubview(gridViewColumns)

    }

    static func removeGrid() {
        gridViewRows.removeFromSuperview()
        gridViewColumns.removeFromSuperview()
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

    var toSimpleConfig: SimpleConfiguration{
        return SimpleConfiguration(height: rowHeight, opacity: opacity, colorPrimary: colorSecondary, colorSpacing: colorSpacing)
    }
}
