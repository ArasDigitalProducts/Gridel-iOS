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
    var gridDemoViewContainer = UIView()
    var gridDemoView = GridViewRows()
    var heightInputView = GridelInputView(
        title: "Height",
        keyboardType: .numberPad,
        rightView: UIImageView(image: UIImage(systemName: "chevron.down"))
    )
    var gutterInputView = GridelInputView(
        title: "Gutter",
        keyboardType: .numberPad
    )
    var heightAndGutterStackView = UIStackView()

    var colorLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
    var colorRightLabel = UILabel()
    lazy var colorInputView: GridelInputView = {
        return GridelInputView(
            title: "Color",
            keyboardType: .asciiCapable,
            leftView: colorLeftView,
            rightView: colorRightLabel
        ) { [weak self] in
            self?.colorInputTapped()
        }
    }()

    //delegate
    weak var delegate: RowsOptionsDelegate?

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
        //grid demo view
        gridDemoView.backgroundColor = .clear
        //height and gutter
        heightAndGutterStackView.axis = .horizontal
        heightAndGutterStackView.distribution = .fillEqually
        heightAndGutterStackView.spacing = 16
        heightInputView.rightView.tintColor = .white
        //color
        colorInputView.textField.text = "9884FF"
        colorLeftView.backgroundColor = .p300
        colorLeftView.layer.cornerRadius = 2
        colorInputView.textField.isUserInteractionEnabled = false
        colorInputView.textField.leftViewMode = .always
        colorRightLabel.text = "20%"
        colorRightLabel.textColor = .white
    }

    private func renderViews() {
        // container view
        addSubview(containerView)
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

        // grid demo view
        containerView.addSubview(gridDemoViewContainer)
        gridDemoViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridDemoViewContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gridDemoViewContainer.topAnchor.constraint(equalTo: showRowsView.bottomAnchor, constant: 32),
            gridDemoViewContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gridDemoViewContainer.heightAnchor.constraint(equalToConstant: 136)
        ])
        //height and gutter
        heightAndGutterStackView.addArrangedSubview(heightInputView)
        heightAndGutterStackView.addArrangedSubview(gutterInputView)
        containerView.addSubview(heightAndGutterStackView)
        heightAndGutterStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAndGutterStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            heightAndGutterStackView.topAnchor.constraint(equalTo: gridDemoViewContainer.bottomAnchor, constant: 40),
            heightAndGutterStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            heightAndGutterStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
        // color input
        containerView.addSubview(colorInputView)
        colorInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorInputView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            colorInputView.topAnchor.constraint(equalTo: heightAndGutterStackView.bottomAnchor, constant: 16),
            colorInputView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            colorInputView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupDelegates() {
        heightInputView.textField.delegate = self
        gutterInputView.textField.delegate = self
        showRowsSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }

    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            guard let config = Gridel.currentRowsConfig else { return }
            Gridel.applyRows(with: config)
        } else {
            Gridel.removeRows()
        }
    }

    private func colorInputTapped() {
        delegate?.rowsColorInputTapped()
    }

    func setupDemoView(with config: RowsConfiguration) {
        gridDemoView = GridViewRows()
        gridDemoView.frame = gridDemoViewContainer.bounds
        gridDemoView.setup(with: config)
        gridDemoViewContainer.addSubview(gridDemoView)
    }
}

extension RowsOptionsView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == heightInputView.textField {
            delegate?.heightUpdated(with: Int(textField.text ?? "0") ?? 0)
        } else if textField == gutterInputView.textField {
            delegate?.rowsGutterUpdated(with: Int(textField.text ?? "0") ?? 0)
        }
    }
}

protocol RowsOptionsDelegate: AnyObject {
    func rowsColorInputTapped()
    func heightUpdated(with height: Int)
    func rowsGutterUpdated(with gutter: Int)
}
