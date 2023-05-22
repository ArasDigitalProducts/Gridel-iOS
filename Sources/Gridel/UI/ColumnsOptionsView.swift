//
//  ColumnsOptionsView.swift
//  
//
//  Created by Marko Benačić on 22.05.2023..
//

import UIKit

class ColumnsOptionsView: UIView {
    var containerView = UIView()

    var showColumnsView = UIView()
    var showColumnsLabel = UILabel()
    var showColumnsSwitch = UISwitch()

    init() {
        super.init(frame: .zero)
        setupViews()
        renderViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        containerView.backgroundColor = .blackBackground
        // show columns view
        showColumnsView.backgroundColor = .g500
        showColumnsView.layer.cornerRadius = 12
        showColumnsLabel.text = "Show Columns"
        showColumnsLabel.textColor = .white
        showColumnsSwitch.isOn = true
        showColumnsSwitch.tintColor = .g75
        showColumnsSwitch.onTintColor = .p300

    }

    func renderViews() {
        // containerView
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        //show columns view
        containerView.addSubview(showColumnsView)
        showColumnsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showColumnsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            showColumnsView.topAnchor.constraint(equalTo: containerView.topAnchor),
            showColumnsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            showColumnsView.heightAnchor.constraint(equalToConstant: 48)
        ])
        //show columns label
        showColumnsView.addSubview(showColumnsLabel)
        showColumnsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showColumnsLabel.leadingAnchor.constraint(equalTo: showColumnsView.leadingAnchor, constant: 16),
            showColumnsLabel.topAnchor.constraint(equalTo: showColumnsView.topAnchor, constant: 12),
            showColumnsLabel.bottomAnchor.constraint(equalTo: showColumnsView.bottomAnchor, constant: -12),
        ])
        //show columns switch
        showColumnsView.addSubview(showColumnsSwitch)
        showColumnsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showColumnsSwitch.trailingAnchor.constraint(equalTo: showColumnsView.trailingAnchor, constant: -16),
            showColumnsSwitch.centerYAnchor.constraint(equalTo: showColumnsView.centerYAnchor)
        ])
    }
}
