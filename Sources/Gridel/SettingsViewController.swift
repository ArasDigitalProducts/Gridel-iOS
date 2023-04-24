//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
//    func configureStyle(with style: ConfigStyle) {
//        Gridel.configStyle = style
//    }

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

    let opacitySlider = UISlider()

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

        opacitySlider.maximumValue = 1
        opacitySlider.minimumValue = 0

        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)

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

        containerView.addSubview(opacitySlider)
        opacitySlider.snp.makeConstraints { make in
            make.top.equalTo(rowSpacingLabel.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(64)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        containerView.addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalToSuperview().offset(-64)
        }

    }

    @objc
    private func applyButtonTapped() {

        let configStyle = ConfigStyle.verbose(configuration: VerboseConfiguration(
            colorPrimary: colorPrimary,
            colorSecondary: colorSecondary,
            colorSpacing: colorSpacing,
            opacity: Double(opacitySlider.value),
            marginSize: Int(marginSizeTextField.text ?? "0") ?? 0,
            columnCount: Int(columnCountTextField.text ?? "0") ?? 0,
            gutterSize: Int(gutterSizeTextField.text ?? "0") ?? 0,
            rowHeight: Int(rowHeightTextField.text ?? "0") ?? 0,
            rowSpacing: Int(rowSpacingTextField.text ?? "0") ?? 0)
        )
        Gridel.applyGrid(with: configStyle)
    }


}
