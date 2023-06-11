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
    var gridDemoContainerView = UIView()
    var gridDemoView = ColumnsGridView()
    var countBackgroundView = RoundedContainerView()

    var countPickerView = UIPickerView()
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

    let countPickerViewOptions: [Int] = Array((1...Constants.maxNumberOfColumns))

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
    weak var delegate: ColumnsOptionsDelegate?

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
        showColumnsView.backgroundColor = .g500
        showColumnsView.layer.cornerRadius = 12
        showColumnsLabel.text = "Show Columns"
        showColumnsLabel.textColor = .white
        showColumnsSwitch.isOn = false
        showColumnsSwitch.tintColor = .g75
        showColumnsSwitch.onTintColor = .p300
        //grid demo view
        gridDemoContainerView.backgroundColor = .clear
        gridDemoView.backgroundColor = .clear
        //count input view
        countInputView.rightView.tintColor = .white
        countInputView.textField.inputView = countPickerView
        //margin and gutter
        marginAndGutterStackView.axis = .horizontal
        marginAndGutterStackView.distribution = .fillEqually
        marginAndGutterStackView.spacing = 16
        //color
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
        containerView.addSubview(gridDemoContainerView)
        gridDemoContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridDemoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gridDemoContainerView.topAnchor.constraint(equalTo: showColumnsView.bottomAnchor, constant: 32),
            gridDemoContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gridDemoContainerView.heightAnchor.constraint(equalToConstant: 136)
        ])
        // count
        containerView.addSubview(countInputView)
        countInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countInputView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            countInputView.topAnchor.constraint(equalTo: gridDemoContainerView.bottomAnchor, constant: 40),
            countInputView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            countInputView.heightAnchor.constraint(equalToConstant: 56)
        ])
        // margin and gutter
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
        // color input
        containerView.addSubview(colorInputView)
        colorInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorInputView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            colorInputView.topAnchor.constraint(equalTo: marginAndGutterStackView.bottomAnchor, constant: 16),
            colorInputView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            colorInputView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupDelegates() {
        countInputView.textField.delegate = self
        marginInputView.textField.delegate = self
        gutterInputView.textField.delegate = self
        showColumnsSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        countPickerView.delegate = self
        countPickerView.dataSource = self
    }

    @objc func switchValueChanged(_ sender: UISwitch) {
        if !sender.isOn {
            Gridel.removeColumns()
        }
    }

    private func colorInputTapped() {
        delegate?.columnsColorInputTapped()
    }

    func setupDemoView(with config: ColumnsConfiguration) {
        gridDemoView.removeFromSuperview()

        gridDemoView = ColumnsGridView()
        gridDemoView.translatesAutoresizingMaskIntoConstraints = false
        gridDemoView.setup(with: config)

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

extension ColumnsOptionsView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == countInputView.textField, let text = textField.text {
            delegate?.countUpdated(with: Int(text) ?? 1)
        } else if textField == marginInputView.textField, let text = textField.text {
            delegate?.marginsUpdated(with: Int(text) ?? 0)
        } else if textField == gutterInputView.textField, let text = textField.text {
            delegate?.columnsGutterUpdated(with: Int(text) ?? 0)
        }
    }
}

extension ColumnsOptionsView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.maxNumberOfColumns
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(countPickerViewOptions[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countInputView.textField.text = String(countPickerViewOptions[row])
    }
}

protocol ColumnsOptionsDelegate: AnyObject {
    func columnsColorInputTapped()
    func countUpdated(with count: Int)
    func marginsUpdated(with margins: Int)
    func columnsGutterUpdated(with gutter: Int)
}
