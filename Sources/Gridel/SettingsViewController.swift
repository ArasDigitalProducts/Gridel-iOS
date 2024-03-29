//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit

class SettingsViewController: UIViewController {

    lazy var containerView = UIView()
    lazy var cancelButton = UIBarButtonItem(
        title: "Cancel",
        style: .plain,
        target: self,
        action: #selector(cancelTapped)
    )
    lazy var saveButton = UIBarButtonItem(
        title: "Save",
        style: .plain,
        target: self,
        action: #selector(saveTapped)
    )
    lazy var optionSegmentView = UISegmentedControl(items: ["Columns", "Rows"])
    lazy var columnsOptionsView = ColumnsOptionsView()
    lazy var rowsOptionsView = RowsOptionsView()

    // MARK: - columns settings
    var columnsColor: UIColor = .p300.withAlphaComponent(0.2) {
        didSet {
            columnsConfigUpdated()
        }
    }
    var columnsCount: Int? {
        didSet {
            columnsConfigUpdated()
        }
    }
    var columnsMargins: Int? {
        didSet {
            columnsConfigUpdated()
        }
    }
    var columnsGutter: Int? {
        didSet {
            columnsConfigUpdated()
        }
    }

    // MARK: - rows settings
    var rowsColor: UIColor = .p300.withAlphaComponent(0.2) {
        didSet {
            rowsConfigUpdated()
        }
    }

    var rowsHeight: Int? {
        didSet {
            rowsConfigUpdated()
        }
    }

    var rowsGutter: Int? {
        didSet {
            rowsConfigUpdated()
        }
    }


    // MARK: - lifecycle
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()
        setupUI()
        renderViews()
        setupDelegates()
        setupKeyboardOffset()
    }

    override func viewDidDisappear(_ animated: Bool) {
        Gridel.gridelWindow?.isUserInteractionEnabled = false
    }

    private func setupDelegates() {
        columnsOptionsView.delegate = self
        rowsOptionsView.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = .blackBackground
        containerView.backgroundColor = .blackBackground

        navigationItem.title = "Gridel"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        navigationItem.leftBarButtonItem = cancelButton
        cancelButton.tintColor = .p300

        navigationItem.rightBarButtonItem = saveButton
        saveButton.tintColor = .p300

        optionSegmentView.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        optionSegmentView.backgroundColor = .g400
        optionSegmentView.selectedSegmentTintColor = .p300
        optionSegmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        optionSegmentView.selectedSegmentIndex = 0
    }

    private func renderViews() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        containerView.addSubview(optionSegmentView)
        optionSegmentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            optionSegmentView.heightAnchor.constraint(equalToConstant: 32),
            optionSegmentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            optionSegmentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            optionSegmentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])

        containerView.addSubview(columnsOptionsView)
        columnsOptionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            columnsOptionsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            columnsOptionsView.topAnchor.constraint(equalTo: optionSegmentView.bottomAnchor, constant: 32),
            columnsOptionsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            columnsOptionsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

    }

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            columnsSelected()
        case 1:
            rowsSelected()
        default:
            break
        }
    }

    private func rowsSelected() {
        columnsOptionsView.removeFromSuperview()
        containerView.addSubview(rowsOptionsView)
        rowsOptionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rowsOptionsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            rowsOptionsView.topAnchor.constraint(equalTo: optionSegmentView.bottomAnchor, constant: 32),
            rowsOptionsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            rowsOptionsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    private func columnsSelected() {
        rowsOptionsView.removeFromSuperview()
        containerView.addSubview(columnsOptionsView)
        columnsOptionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            columnsOptionsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            columnsOptionsView.topAnchor.constraint(equalTo: optionSegmentView.bottomAnchor, constant: 32),
            columnsOptionsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            columnsOptionsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    @objc func cancelTapped() {
        dismiss(animated: true)
    }

    @objc func saveTapped() {
        dismiss(animated: true) {
            if self.columnsOptionsView.showColumnsSwitch.isOn, let columnsConfig = Gridel.currentColumnsConfig {
                Gridel.applyColumns(with: columnsConfig)
            }

            if self.rowsOptionsView.showRowsSwitch.isOn, let rowsConfig = Gridel.currentRowsConfig {
                Gridel.applyRows(with: rowsConfig)
            }
        }
    }
}

// MARK: - Color picker delegate
extension SettingsViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        switch optionSegmentView.selectedSegmentIndex {
        case 0:
            columnsColor = color
        case 1:
            rowsColor = color
        default: return
        }
    }

    private func colorInputTapped() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true)

    }
}

// MARK: - Columns settings
extension SettingsViewController: ColumnsOptionsDelegate {
    func columnsColorInputTapped() {
        colorInputTapped()
    }

    func countUpdated(with count: Int) {
        columnsCount = count
    }

    func marginsUpdated(with margins: Int) {
        columnsMargins = margins
    }

    func columnsGutterUpdated(with gutter: Int) {
        columnsGutter = gutter
    }

    private func columnsConfigUpdated() {
        let marginSize = columnsMargins ?? 0
        let columnCount = columnsCount ?? 1
        let gutterSize = columnsGutter ?? 0

        let config = ColumnsConfiguration(
            color: columnsColor,
            colorSpacing: .clear,
            marginSize: marginSize,
            columnCount: columnCount,
            gutterSize: gutterSize,
            opacity: Float(columnsColor.rgba.alpha)
        )

        Gridel.currentColumnsConfig = config
        columnsOptionsView.setupDemoView(with: config)
        columnsOptionsView.colorInputView.leftView?.backgroundColor = columnsColor
        columnsOptionsView.colorInputView.textField.text = columnsColor.toHexString().uppercased()
        columnsOptionsView.colorRightLabel.text = columnsColor.cgColor.alpha.toPercentageString()
    }
}

// MARK: - Rows settings
extension SettingsViewController: RowsOptionsDelegate {
    func rowsColorInputTapped() {
        colorInputTapped()
    }

    func rowsGutterUpdated(with gutter: Int) {
        rowsGutter = gutter
    }

    func heightUpdated(with height: Int) {
        rowsHeight = height
    }

    private func rowsConfigUpdated() {
        let height = rowsHeight ?? 0
        let gutter = rowsGutter ?? 0

        let config = RowsConfiguration(
            height: height,
            gutterSize: gutter,
            colorPrimary: rowsColor,
            colorSpacing: .clear,
            opacity: Float(rowsColor.rgba.alpha)
        )

        Gridel.currentRowsConfig = config
        rowsOptionsView.setupDemoView(with: config)
        rowsOptionsView.colorInputView.leftView?.backgroundColor = rowsColor
        rowsOptionsView.colorInputView.textField.text = rowsColor.toHexString().uppercased()
        rowsOptionsView.colorRightLabel.text = rowsColor.cgColor.alpha.toPercentageString()

    }
}

// MARK: - keyboard offset
private extension SettingsViewController {
    func setupKeyboardOffset() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc
    private func keyboardWillShow(notification: NSNotification) {
        view.frame.origin.y = 0
        if let keyboardFrame: NSValue = notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomFreeSpace = getBottomAvailableSpace()
            let padding: CGFloat = 20
            if keyboardHeight + padding > bottomFreeSpace {
                view.frame.origin.y -= (keyboardHeight - bottomFreeSpace + padding)
            }
        }
    }

    @objc
    private func keyboardWillHide() {
        view.frame.origin.y = 0
    }

    private func getBottomAvailableSpace() -> CGFloat {
        switch optionSegmentView.selectedSegmentIndex {
        case 0:
            return columnsOptionsView.frame.size.height - (columnsOptionsView.colorInputView.frame.size.height + columnsOptionsView.colorInputView.frame.origin.y)
        case 1:
            return rowsOptionsView.frame.size.height - (rowsOptionsView.colorInputView.frame.size.height + rowsOptionsView.colorInputView.frame.origin.y)
        default:
            return 0
        }
    }
}
