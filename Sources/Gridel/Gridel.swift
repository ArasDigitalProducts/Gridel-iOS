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

        let settingsNavigationController = UINavigationController(rootViewController: SettingsViewController())

        gridelWindow?.rootViewController = rootView

        trigger.subscribe {
            if isGridActive {
                removeGrid()
            } else {
                gridelWindow?.isUserInteractionEnabled = true
                gridelWindow?.rootViewController?.present(settingsNavigationController, animated: true)
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

    static func applySimpleGrid(with config: RowsConfiguration) {
//        guard let gridelWindow else { return }
//
//        gridViewRows = GridViewRows()
//        gridViewRows.frame = gridelWindow.bounds
//        gridViewRows.setup(with: config)
//
//        gridViewRows.isUserInteractionEnabled = false
//        gridelWindow.addSubview(gridViewRows)
    }

    static func applyVerboseGrid(with config: ColumnsConfiguration) {
//        guard let gridelWindow else { return }
//
//        gridViewRows = GridViewRows()
//        gridViewRows.frame = gridelWindow.bounds
//        gridViewRows.setup(with: config.toSimpleConfig)
//        gridViewRows.isUserInteractionEnabled = false
//
//        gridViewColumns = GridViewColumns()
//        gridViewColumns.frame = gridelWindow.bounds
//        gridViewColumns.setup(with: config)
//        gridViewColumns.isUserInteractionEnabled = false
//
//        gridelWindow.addSubview(gridViewRows)
//        gridelWindow.addSubview(gridViewColumns)

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
    case simple(configuration: RowsConfiguration)
    case verbose(configuration: ColumnsConfiguration)
}

public struct RowsConfiguration {
    let height: Int
//    let opacity: Float
    let colorPrimary: UIColor
    let colorSpacing: UIColor
}

public struct ColumnsConfiguration {
    let color: UIColor
    let colorSpacing: UIColor
//    let opacity: Float

    let marginSize: Int
    let columnCount: Int
    let gutterSize: Int

//    let rowHeight: Int

//    var toSimpleConfig: SimpleConfiguration{
//        return SimpleConfiguration(height: rowHeight, opacity: opacity, colorPrimary: colorSecondary, colorSpacing: colorSpacing)
//    }
}
