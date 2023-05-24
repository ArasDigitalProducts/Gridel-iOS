//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit

class SettingsViewController: UIViewController {

    var containerView: UIView!
    var cancelButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem!
    var optionSegmentView: UISegmentedControl!
    var columnsOptionsView: ColumnsOptionsView!
    var rowsOptionsView: UIView!

    // MARK: - columns settings
    var columnsColor: UIColor = .p300 {
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
    var rowsColor: UIColor = .p300 {
        didSet {
            rowsColorUpdated(with: rowsColor)
        }
    }

    // MARK: - lifecycle
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()

        initViews()
        setupUI()
        renderViews()
        setupDelegates()
    }

    override func viewDidDisappear(_ animated: Bool) {
        Gridel.gridelWindow?.isUserInteractionEnabled = false
    }

    private func initViews() {
        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        optionSegmentView = UISegmentedControl(items: ["Columns", "Rows"])
        containerView = UIView()
        columnsOptionsView = ColumnsOptionsView()

        rowsOptionsView = UIView()
        rowsOptionsView.backgroundColor = .orange
    }

    private func setupDelegates() {
        columnsOptionsView.delegate = self
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
            rowsSelected()
        case 1:
            columnsSelected()
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
        print("columns")
    }

    @objc func cancelTapped() {

    }

    @objc func saveTapped() {
        
    }

    private func rowsColorUpdated(with color: UIColor) {

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
}

// MARK: - Columns settings
extension SettingsViewController: ColumnsOptionsDelegate {
    func colorInputTapped() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true)
    }

    func countUpdated(with count: Int) {
        columnsCount = count
    }

    func marginsUpdated(with margins: Int) {
        columnsMargins = margins
    }

    func gutterUpdated(with gutter: Int) {
        columnsGutter = gutter
    }

    private func columnsConfigUpdated() {
        let marginSize = columnsMargins ?? 0
        let columnCount = columnsCount ?? 1
        let gutterSize = columnsGutter ?? 0

        let config = ColumnsConfiguration(color: columnsColor, colorSpacing: .blackBackground, marginSize: marginSize, columnCount: columnCount, gutterSize: gutterSize)

        columnsOptionsView.setupDemoView(with: config)
        columnsOptionsView.colorInputView.leftView?.backgroundColor = columnsColor
        columnsOptionsView.colorInputView.textField.text = columnsColor.toHexString().uppercased()
        columnsOptionsView.colorRightLabel.text = columnsColor.cgColor.alpha.toPercentageString()
    }
}
