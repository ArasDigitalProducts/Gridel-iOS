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
    static var settingsViewController = SettingsViewController()

    static var trigger = Triggers.shake

    static var currentColumnsConfig: ColumnsConfiguration?
    static var currentRowsConfig: RowsConfiguration?

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

        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)

        gridelWindow?.rootViewController = rootView

        trigger.subscribe {
            if gridelWindow?.rootViewController?.presentedViewController == nil {
                gridelWindow?.isUserInteractionEnabled = true
                gridelWindow?.rootViewController?.present(settingsNavigationController, animated: true)
            }
        }
    }

    static func applyRows(with config: RowsConfiguration) {
        guard let gridelWindow else { return }

        gridViewRows = GridViewRows()
        gridViewRows.frame = gridelWindow.bounds
        gridViewRows.setup(with: config)

        gridViewRows.isUserInteractionEnabled = false
        gridelWindow.addSubview(gridViewRows)
    }

    static func applyColumns(with config: ColumnsConfiguration) {
        guard let gridelWindow else { return }

        gridViewColumns = GridViewColumns()
        gridViewColumns.frame = gridelWindow.bounds
        gridViewColumns.setup(with: config)
        gridViewColumns.isUserInteractionEnabled = false

        gridelWindow.addSubview(gridViewColumns)
    }

    static func removeRows() {
        gridViewRows.removeFromSuperview()
    }

    static func removeColumns() {
        gridViewColumns.removeFromSuperview()
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

public struct RowsConfiguration {
    let height: Int
    let gutterSize: Int
    let colorPrimary: UIColor
    let colorSpacing: UIColor
    let opacity: Float
}

public struct ColumnsConfiguration {
    let color: UIColor
    let colorSpacing: UIColor
    let marginSize: Int
    let columnCount: Int
    let gutterSize: Int
    let opacity: Float
}
