//
//  RowsOptionsView.swift
//  
//
//  Created by Marko Benačić on 29.05.2023..
//

import UIKit

class RowsOptionsView: UIView {
    var containerView = UIView()

    var showRowsView = UIView()
    var showRowsLabel = UILabel()
    var showRowsSwitch = UISwitch()

    init() {
        super.init(frame: .zero)
        setupUI()
        renderViews()
        setupDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // container view
        containerView.backgroundColor = .blackBackground
        // show columns view
        showRowsView.backgroundColor = .g500
        showRowsView.layer.cornerRadius = 12
        showRowsLabel.text = "Show Rows"
        showRowsLabel.textColor = .white
        showRowsSwitch.isOn = false
        showRowsSwitch.tintColor = .g75
        showRowsSwitch.onTintColor = .p300
    }

    private func renderViews() {
        // container view
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        //show Rows view
        containerView.addSubview(showRowsView)
        showRowsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showRowsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            showRowsView.topAnchor.constraint(equalTo: containerView.topAnchor),
            showRowsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            showRowsView.heightAnchor.constraint(equalToConstant: 48)
        ])
        //show Rows label
        showRowsView.addSubview(showRowsLabel)
        showRowsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showRowsLabel.leadingAnchor.constraint(equalTo: showRowsView.leadingAnchor, constant: 16),
            showRowsLabel.topAnchor.constraint(equalTo: showRowsView.topAnchor, constant: 12),
            showRowsLabel.bottomAnchor.constraint(equalTo: showRowsView.bottomAnchor, constant: -12),
        ])
        //show Rows switch
        showRowsView.addSubview(showRowsSwitch)
        showRowsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showRowsSwitch.trailingAnchor.constraint(equalTo: showRowsView.trailingAnchor, constant: -16),
            showRowsSwitch.centerYAnchor.constraint(equalTo: showRowsView.centerYAnchor)
        ])
    }

    private func setupDelegates() {

    }
}
