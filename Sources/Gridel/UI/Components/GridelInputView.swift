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
    var leftView: UIView?

    init(title: String? = nil, keyboardType: UIKeyboardType, leftView: UIView? = nil, rightView: UIView = UIView()) {
        self.title = title
        self.keyboardType = keyboardType
        self.rightView = rightView
        self.leftView = leftView

        super.init()

        setupViews()
        renderViews()
        setupTouchGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        textField.backgroundColor = .g500
        titleLabel.text = title
        titleLabel.textColor = .g75
        titleLabel.font = .systemFont(ofSize: 10)
        textField.keyboardType = keyboardType
        textField.textColor = .white

        if let leftView {
            textField.leftView = leftView
        }

    }

    private func renderViews() {
        //container view
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
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
//            titleLabel.heightAnchor.constraint(equalToConstant: 16) // revise this (FONT)
        ])
        //textField
        containerView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        //rightView
        containerView.addSubview(rightView)
        rightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            rightView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    private func setupTouchGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tapGesture)

    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            textField.becomeFirstResponder()
        }
    }

}
