//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit

class SettingsViewController: UIViewController {

    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: SettingsViewController.self, action: #selector(leftButtonAction))
    let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: SettingsViewController.self, action: #selector(rightButtonAction))

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()

        setupUI()
        renderViews()
    }

    override func viewWillDisappear(_ animated: Bool) {
        Gridel.gridelWindow?.isUserInteractionEnabled = false
    }

    private func setupUI() {

        title = "Gridel"

        navigationItem.leftBarButtonItem = cancelButton
        cancelButton.tintColor = .primary1

        navigationItem.rightBarButtonItem = saveButton
        saveButton.tintColor = .primary1
    }

    private func renderViews() {

    }

    @objc func leftButtonAction() {
        // Code to handle left button tap
    }

    @objc func rightButtonAction() {
        // Code to handle right button tap
    }

}
