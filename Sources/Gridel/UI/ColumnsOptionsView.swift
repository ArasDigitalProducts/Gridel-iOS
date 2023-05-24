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
    var countInputView = GridelInputView(
        title: "Count",
        keyboardType: .numberPad,
        rightView: UIImageView(image: UIImage(systemName: "chevron.down"))
    )
    var marginInputView = GridelInputView(title: "Margins", keyboardType: .numberPad)
    var gutterInputView = GridelInputView(title: "Gutter", keyboardType: .numberPad)
    var marginAndGutterStackView = UIStackView()

    var colorLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
    var colorRightLabel = UILabel()

    var colorInputView: GridelInputView!

    //delegate
    weak var delegate: ColumnsOptionsDelegate?

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
        //count input view
        countInputView.rightView.tintColor = .white
        //margin and gutter
        marginAndGutterStackView.axis = .horizontal
        marginAndGutterStackView.distribution = .fillEqually
        marginAndGutterStackView.spacing = 16
        //color
        colorInputView = GridelInputView(
            title: "Color",
            keyboardType: .asciiCapable,
            leftView: colorLeftView,
            rightView: colorRightLabel
        ) { [weak self] in
            self?.colorInputTapped()
        }
        colorInputView.textField.text = "9884FF"
        colorLeftView.backgroundColor = .p300
        colorLeftView.layer.cornerRadius = 2
        colorInputView.textField.isUserInteractionEnabled = false
        colorInputView.textField.leftViewMode = .always
        colorRightLabel.text = "20%"
        colorRightLabel.textColor = .white

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
        containerView.addSubview(countInputView)
        countInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countInputView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            countInputView.topAnchor.constraint(equalTo: gridDemoView.bottomAnchor, constant: 40),
            countInputView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            countInputView.heightAnchor.constraint(equalToConstant: 56)
        ])

        marginAndGutterStackView.addArrangedSubview(marginInputView)
        marginAndGutterStackView.addArrangedSubview(gutterInputView)
        containerView.addSubview(marginAndGutterStackView)
        marginAndGutterStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            marginAndGutterStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            marginAndGutterStackView.topAnchor.constraint(equalTo: countInputView.bottomAnchor, constant: 16),
            marginAndGutterStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            marginAndGutterStackView.heightAnchor.constraint(equalToConstant: 56)
        ])

        containerView.addSubview(colorInputView)
        colorInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorInputView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            colorInputView.topAnchor.constraint(equalTo: marginAndGutterStackView.bottomAnchor, constant: 16),
            colorInputView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            colorInputView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func colorInputTapped() {
        delegate?.colorInputTapped()
    }
}

protocol ColumnsOptionsDelegate: AnyObject {
    func colorInputTapped()
    func colorSelected(color: UIColor)
}
