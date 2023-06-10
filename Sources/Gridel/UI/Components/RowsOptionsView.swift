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
    var gridDemoContainerView = UIView()
    var gridDemoView = RowsGridView()
    var heightInputView = GridelInputView(
        title: "Height",
        keyboardType: .numberPad
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

    let gridDemoContainerInitialHeight: CGFloat = 136
    lazy var gridDemoContainerHeightConstraint = NSLayoutConstraint(
        item: gridDemoContainerView,
        attribute: .height,
        relatedBy: .equal,
        toItem: nil,
        attribute: .notAnAttribute,
        multiplier: 1.0,
        constant: gridDemoContainerInitialHeight)

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
        containerView.addSubview(gridDemoContainerView)
        gridDemoContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridDemoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gridDemoContainerView.topAnchor.constraint(equalTo: showRowsView.bottomAnchor, constant: 32),
            gridDemoContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gridDemoContainerHeightConstraint
        ])
        //height and gutter
        heightAndGutterStackView.addArrangedSubview(heightInputView)
        heightAndGutterStackView.addArrangedSubview(gutterInputView)
        containerView.addSubview(heightAndGutterStackView)
        heightAndGutterStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAndGutterStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            heightAndGutterStackView.topAnchor.constraint(equalTo: gridDemoContainerView.bottomAnchor, constant: 40),
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
        if !sender.isOn {
            Gridel.removeRows()
        }
    }

    private func colorInputTapped() {
        delegate?.rowsColorInputTapped()
    }

    func setupDemoView(with config: RowsConfiguration) {
        gridDemoView.removeFromSuperview()

        gridDemoView = RowsGridView()
        gridDemoView.translatesAutoresizingMaskIntoConstraints = false
        gridDemoView.setup(with: config, fixedHeight: Float(gridDemoContainerHeightConstraint.constant))

        gridDemoContainerView.addSubview(gridDemoView)
        NSLayoutConstraint.activate([
            gridDemoView.leadingAnchor.constraint(equalTo: gridDemoContainerView.leadingAnchor),
            gridDemoView.topAnchor.constraint(equalTo: gridDemoContainerView.topAnchor),
            gridDemoView.trailingAnchor.constraint(equalTo: gridDemoContainerView.trailingAnchor),
            gridDemoView.bottomAnchor.constraint(equalTo: gridDemoContainerView.bottomAnchor)

        ])
        gridDemoView.layoutIfNeeded()
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

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let newString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let newNumber = numberFormatter.number(from: newString ?? "")
        let newValue = newNumber?.intValue ?? 0

        if newValue > 128 {
            return false
        }

        return true
    }

}

protocol RowsOptionsDelegate: AnyObject {
    func rowsColorInputTapped()
    func heightUpdated(with height: Int)
    func rowsGutterUpdated(with gutter: Int)
}
