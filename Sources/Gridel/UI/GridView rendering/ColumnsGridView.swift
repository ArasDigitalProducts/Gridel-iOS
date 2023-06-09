//
//  GridViewColumns.swift
//  
//
//  Created by Marko Benačić on 26.04.2023..
//

import UIKit

class ColumnsGridView: UIView {

    private let containerView = UIView()
    private let stackView = UIStackView()
    private var config: ColumnsConfiguration?

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with config: ColumnsConfiguration) {
        self.config = config
        setupUI()
        renderViews()
    }

    private func setupUI() {
        guard let config else { return }
        stackView.axis = .horizontal
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }

        stackView.spacing = CGFloat(config.gutterSize)
        stackView.distribution = .fillEqually

        (1...config.columnCount).forEach { _ in
            let columnView = UIView()
            columnView.backgroundColor = config.color
            stackView.addArrangedSubview(columnView)
        }
    }

    private func renderViews() {
        guard let config else { return }

        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(config.marginSize)),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-config.marginSize)),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
