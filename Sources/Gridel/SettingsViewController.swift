//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit

class SettingsViewController: UIViewController {
    func configureStyle(with style: ConfigStyle) {
        Gridel.configStyle = style
    }

    override func viewDidLoad() {
        view.backgroundColor = .brown
    }
}
