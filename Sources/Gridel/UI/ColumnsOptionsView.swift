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
    var gridDemoView = GridDemoView()
    var countBackgroundView = RoundedContainerView()
    var countTextField = UITextField()
    var chevronImage = UIImageView(image: UIImage(systemName: "chevron.down"))
//    var countRightIcon = UIButton()

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
        //grid demo view
        gridDemoView.backgroundColor = .p300
        //count
        countTextField.backgroundColor = .g500
        countTextField.placeholder = "count"
        countTextField.keyboardType = .numberPad
        countTextField.rightView = chevronImage
        countTextField.textColor = .white

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
        // grid demo view
        containerView.addSubview(gridDemoView)
        gridDemoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridDemoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gridDemoView.topAnchor.constraint(equalTo: showColumnsView.bottomAnchor, constant: 32),
            gridDemoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gridDemoView.heightAnchor.constraint(equalToConstant: 136)
        ])
        // count
        containerView.addSubview(countBackgroundView)
        countBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countBackgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            countBackgroundView.topAnchor.constraint(equalTo: gridDemoView.bottomAnchor, constant: 40),
            countBackgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            countBackgroundView.heightAnchor.constraint(equalToConstant: 56)
        ])
        countBackgroundView.addSubview(countTextField)
        countTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countTextField.leadingAnchor.constraint(equalTo: countBackgroundView.leadingAnchor, constant: 16),
            countTextField.trailingAnchor.constraint(equalTo: countBackgroundView.trailingAnchor, constant: -16),
            countTextField.centerYAnchor.constraint(equalTo: countBackgroundView.centerYAnchor)
        ])
    }
}
