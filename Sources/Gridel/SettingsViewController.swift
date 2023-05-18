//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit

class SettingsViewController: UIViewController {

    var cancelButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()

        setupUI()
        renderViews()
    }

    override func viewDidDisappear(_ animated: Bool) {
        Gridel.gridelWindow?.isUserInteractionEnabled = false
    }

    private func setupUI() {
        view.backgroundColor = .blackBackground

//        title = "Gridel"
        navigationItem.title = "Gridel"
//        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonAction))
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(rightButtonAction))

        navigationItem.leftBarButtonItem = cancelButton
        cancelButton.tintColor = .p300

        navigationItem.rightBarButtonItem = saveButton
        saveButton.tintColor = .p300
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
