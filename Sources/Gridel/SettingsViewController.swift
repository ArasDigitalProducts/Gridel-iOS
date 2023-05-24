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

    var columnsColor: UIColor = .p300 {
        didSet {
            columnsColorUpdated(with: columnsColor)
        }
    }
    var rowsColor: UIColor = .p300 {
        didSet {
            rowsColorUpdated(with: rowsColor)
        }
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()

        initViews()
        setupUI()
        renderViews()
    }

    override func viewDidDisappear(_ animated: Bool) {
        Gridel.gridelWindow?.isUserInteractionEnabled = false
    }

    private func initViews() {
        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonAction))
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(rightButtonAction))
        optionSegmentView = UISegmentedControl(items: ["Columns", "Rows"])
        containerView = UIView()
        columnsOptionsView = ColumnsOptionsView()
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
        print("rows")
    }

    private func columnsSelected() {
        print("columns")
    }

    @objc func leftButtonAction() {

    }

    @objc func rightButtonAction() {
        
    }

    private func columnsColorUpdated(with color: UIColor) {
//        columnsOptionsView.gridDemoView.backgroundColor = color

        let config = ColumnsConfiguration(color: color, colorSpacing: .blackBackground, marginSize: 16, columnCount: 5, gutterSize: 8)

        columnsOptionsView.setupDemoView(with: config)
        columnsOptionsView.colorInputView.leftView?.backgroundColor = color
        columnsOptionsView.colorInputView.textField.text = color.toHexString().uppercased()
        columnsOptionsView.colorRightLabel.text = color.cgColor.alpha.toPercentageString()
    }

    private func rowsColorUpdated(with color: UIColor) {

    }
}

extension SettingsViewController: ColumnsOptionsDelegate {
    func colorInputTapped() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true)
    }
}

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
