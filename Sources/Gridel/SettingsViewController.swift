//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

//    var marginSize: Int = 0
//    var columnCount: Int = 0
//    var gutterSize: Int = 0
//    var rowHeight: Int = 0
//    var rowSpacing: Int = 0
//    var opacity: Double = 1
    var colorPrimary: UIColor = .cyan
    var colorSecondary: UIColor = .magenta
    var colorSpacing: UIColor = .white

    let containerView = UIView()

    let applyButton = UIButton(type: .roundedRect)

    let marginSizeLabel = UILabel()
    let marginSizeTextField = UITextField()
    let columnCountLabel = UILabel()
    let columnCountTextField = UITextField()
    let gutterSizeLabel = UILabel()
    let gutterSizeTextField = UITextField()
    let rowHeightLabel = UILabel()
    let rowHeightTextField = UITextField()
    let rowSpacingLabel = UILabel()
    let rowSpacingTextField = UITextField()

    let opacityLabel = UILabel()
    let opacitySlider = UISlider()

    let optionSwitch = UISwitch()
    let optionLabel = UILabel()

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupHideKeyboardOnTap()

        setupUI()
        renderViews()
    }

    private func setupUI() {
        applyButton.setTitle("Apply", for: .normal)
        applyButton.layer.cornerRadius = 20
        applyButton.backgroundColor = .systemBlue
        applyButton.setTitleColor(.white, for: .normal)

        marginSizeLabel.text = "Margin size"
        marginSizeTextField.keyboardType = .numberPad
        marginSizeTextField.borderStyle = .bezel

        columnCountLabel.text = "Number of columns"
        columnCountTextField.keyboardType = .numberPad
        columnCountTextField.borderStyle = .bezel

        gutterSizeLabel.text = "Gutter size"
        gutterSizeTextField.keyboardType = .numberPad
        gutterSizeTextField.borderStyle = .bezel

        rowHeightLabel.text = "Row height"
        rowHeightTextField.keyboardType = .numberPad
        rowHeightTextField.borderStyle = .bezel

        rowSpacingLabel.text = "Row spacing"
        rowSpacingTextField.keyboardType = .numberPad
        rowSpacingTextField.borderStyle = .bezel

        opacityLabel.text = "Opacity"
        opacitySlider.maximumValue = 1
        opacitySlider.minimumValue = 0
        opacitySlider.value = 0.5

        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)

        optionSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        optionLabel.text = "Verbose"
    }

    private func renderViews() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        //marginSize
        containerView.addSubview(marginSizeLabel)
        containerView.addSubview(marginSizeTextField)

        marginSizeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(8)
        }
        marginSizeTextField.snp.makeConstraints { make in
            make.leading.equalTo(marginSizeLabel.snp.trailing).offset(16)
            make.centerY.equalTo(marginSizeLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
        }

        //columnCount
        containerView.addSubview(columnCountLabel)
        containerView.addSubview(columnCountTextField)

        columnCountLabel.snp.makeConstraints { make in
            make.top.equalTo(marginSizeLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }

        columnCountTextField.snp.makeConstraints { make in
            make.leading.equalTo(columnCountLabel.snp.trailing).offset(16)
            make.centerY.equalTo(columnCountLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
        }

        //gutterSize
        containerView.addSubview(gutterSizeLabel)
        containerView.addSubview(gutterSizeTextField)

        gutterSizeLabel.snp.makeConstraints { make in
            make.top.equalTo(columnCountLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }

        gutterSizeTextField.snp.makeConstraints { make in
            make.leading.equalTo(gutterSizeLabel.snp.trailing).offset(16)
            make.centerY.equalTo(gutterSizeLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
        }

        //rowHeight
        containerView.addSubview(rowHeightLabel)
        containerView.addSubview(rowHeightTextField)

        rowHeightLabel.snp.makeConstraints { make in
            make.top.equalTo(gutterSizeLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }

        rowHeightTextField.snp.makeConstraints { make in
            make.leading.equalTo(rowHeightLabel.snp.trailing).offset(16)
            make.centerY.equalTo(rowHeightLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
        }

        //rowSpacing
        containerView.addSubview(rowSpacingLabel)
        containerView.addSubview(rowSpacingTextField)

        rowSpacingLabel.snp.makeConstraints { make in
            make.top.equalTo(rowHeightLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }

        rowSpacingTextField.snp.makeConstraints { make in
            make.leading.equalTo(rowSpacingLabel.snp.trailing).offset(16)
            make.centerY.equalTo(rowSpacingLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
        }

        //Slider
        containerView.addSubview(opacityLabel)
        opacityLabel.snp.makeConstraints { make in
            make.top.equalTo(rowSpacingLabel.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
        }

        containerView.addSubview(opacitySlider)
        opacitySlider.snp.makeConstraints { make in
            make.top.equalTo(opacityLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(64)
            make.leading.trailing.equalToSuperview().inset(16)
        }


        //OptionLabel
        containerView.addSubview(optionLabel)
        optionLabel.snp.makeConstraints { make in
            make.top.equalTo(opacitySlider.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
        //Option switch
        containerView.addSubview(optionSwitch)
        optionSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(optionLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(optionLabel.snp.trailing)
        }

        //Apply button
        containerView.addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalToSuperview().offset(-64)
        }

    }

    @objc
    private func applyButtonTapped() {

        if optionSwitch.isOn {
            let configStyle = ConfigStyle.simple(configuration: .init(height: Int(rowHeightTextField.text ?? "0") ?? 0, opacity: opacitySlider.value, colorPrimary: colorPrimary, colorSpacing: colorSpacing))

            Gridel.applyGrid(with: configStyle)
        } else {
            let configStyle = ConfigStyle.verbose(configuration: VerboseConfiguration(
                colorPrimary: colorPrimary,
                colorSecondary: colorSecondary,
                colorSpacing: colorSpacing,
                opacity: opacitySlider.value,
                marginSize: Int(marginSizeTextField.text ?? "0") ?? 0,
                columnCount: Int(columnCountTextField.text ?? "0") ?? 0,
                gutterSize: Int(gutterSizeTextField.text ?? "0") ?? 0,
                rowHeight: Int(rowHeightTextField.text ?? "0") ?? 0,
                rowSpacing: Int(rowSpacingTextField.text ?? "0") ?? 0)
            )
            Gridel.applyGrid(with: configStyle)
        }

        Gridel.gridelWindow?.isUserInteractionEnabled = false
        self.dismiss(animated: true)

    }

    @objc
    private func switchChanged(configSwitch: UISwitch) {
        if configSwitch.isOn {
            optionLabel.text = "Simple"

            marginSizeTextField.isEnabled = false
            marginSizeTextField.backgroundColor = .gray
            columnCountTextField.isEnabled = false
            columnCountTextField.backgroundColor = .gray
            gutterSizeTextField.isEnabled = false
            gutterSizeTextField.backgroundColor = .gray
            rowSpacingTextField.isEnabled = false
            rowSpacingTextField.backgroundColor = .gray
        } else {
            optionLabel.text = "Verbose"

            marginSizeTextField.isEnabled = true
            marginSizeTextField.backgroundColor = .systemBackground
            columnCountTextField.isEnabled = true
            columnCountTextField.backgroundColor = .systemBackground
            gutterSizeTextField.isEnabled = true
            gutterSizeTextField.backgroundColor = .systemBackground
            rowSpacingTextField.isEnabled = true
            rowSpacingTextField.backgroundColor = .systemBackground
        }
    }


}
