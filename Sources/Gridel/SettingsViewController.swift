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

    var marginSize: Int = 0
    var columnCount: Int = 0
    var gutterSize: Int = 0
    var rowHeight: Int = 0
    var rowSpacing: Int = 0
    var opacity: Double = 1
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
        view.backgroundColor = .gray

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

        columnCountLabel.text = "Number of columns"
        columnCountTextField.keyboardType = .numberPad

        gutterSizeLabel.text = "Gutter size"
        gutterSizeTextField.keyboardType = .numberPad

        rowHeightLabel.text = "Row height"
        rowHeightTextField.keyboardType = .numberPad

        rowSpacingLabel.text = "Row spacing"
        rowSpacingTextField.keyboardType = .numberPad

        opacitySlider.maximumValue = 1
        opacitySlider.minimumValue = 0

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
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(8)
        }
        marginSizeTextField.snp.makeConstraints { make in
            make.centerY.equalTo(marginSizeLabel.snp.centerY)
            make.leading.equalTo(marginSizeLabel.snp.trailing)
            make.trailing.equalToSuperview().offset(8)
        }

        //columnCount
        containerView.addSubview(columnCountLabel)
        containerView.addSubview(columnCountTextField)

        columnCountLabel.snp.makeConstraints { make in
            make.top.equalTo(marginSizeLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
        }

        columnCountTextField.snp.makeConstraints { make in
            make.leading.equalTo(columnCountLabel.snp.trailing)
            make.centerY.equalTo(columnCountLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(8)
        }

        //gutterSize
        containerView.addSubview(gutterSizeLabel)
        containerView.addSubview(gutterSizeTextField)

        gutterSizeLabel.snp.makeConstraints { make in
            make.top.equalTo(columnCountLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
        }

        gutterSizeTextField.snp.makeConstraints { make in
            make.leading.equalTo(gutterSizeLabel.snp.trailing)
            make.centerY.equalTo(gutterSizeLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(8)
        }

        //rowHeight
        containerView.addSubview(rowHeightLabel)
        containerView.addSubview(rowHeightTextField)

        rowHeightLabel.snp.makeConstraints { make in
            make.top.equalTo(gutterSizeLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
        }

        rowHeightTextField.snp.makeConstraints { make in
            make.leading.equalTo(rowHeightLabel.snp.trailing)
            make.centerY.equalTo(rowHeightLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(8)
        }

        //rowSpacing
        containerView.addSubview(rowSpacingLabel)
        containerView.addSubview(rowSpacingTextField)

        rowSpacingLabel.snp.makeConstraints { make in
            make.top.equalTo(rowHeightLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
        }

        rowSpacingTextField.snp.makeConstraints { make in
            make.leading.equalTo(rowSpacingLabel.snp.trailing)
            make.centerY.equalTo(rowSpacingLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(8)
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
            make.bottom.equalToSuperview().offset(16)
        }

    }


}
