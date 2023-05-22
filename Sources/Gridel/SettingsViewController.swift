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

}
