//
//  GridelInputView.swift
//  
//
//  Created by Marko Benačić on 23.05.2023..
//

import UIKit

class GridelInputView: RoundedContainerView {

    private var title: String?
    private var keyboardType: UIKeyboardType

    private var containerView = UIView()

    var textField = UITextField()
    var titleLabel = UILabel()
    var rightView: UIView

    init(title: String? = nil, keyboardType: UIKeyboardType, rightView: UIView = UIView()) {
        self.title = title
        self.keyboardType = keyboardType
        self.rightView = rightView

        super.init()

        setupViews()
        renderViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        textField.backgroundColor = .g500
        textField.placeholder = "wadkodakwpo"
        titleLabel.text = title
        titleLabel.textColor = .g75
        titleLabel.font = .systemFont(ofSize: 10)
        textField.keyboardType = keyboardType
        textField.textColor = .white

    }

    private func renderViews() {
        //container view
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        //title label
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        //textField
        containerView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
//            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        //rightView

        containerView.addSubview(rightView)
        rightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            rightView.widthAnchor.constraint(equalToConstant: 16),
            rightView.heightAnchor.constraint(equalToConstant: 16)
        ])

//        chevronImage.frame = CGRect(x: countTextField.frame.size.width - 40 , y: countBackgroundView.frame.height / 2, width: 16, height: 16)
    }
}
