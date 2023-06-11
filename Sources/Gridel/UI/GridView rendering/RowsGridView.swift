//
//  GridViewRows.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class RowsGridView: UIView {
    private let containerView = UIView()
    private let scrollView = UIScrollView()

    private var config: RowsConfiguration?
    private var fixedHeight: Float?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with config: RowsConfiguration, fixedHeight: Float? = nil) {
        self.config = config
        self.fixedHeight = fixedHeight
        setupUI()
    }

    private func setupUI() {
        guard let config else { return }

        addSubview(scrollView)
        addSubview(containerView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        var offset: Float = 0
        let height = CGFloat(Float(config.height))
        let gutter = CGFloat(Float(config.gutterSize))
        let finalHeight: Float = fixedHeight ?? Float(frame.height)
        var lastView: UIView?

        while offset < finalHeight {
            let rowView = UIView()
            rowView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(rowView)
            rowView.backgroundColor = config.colorPrimary
            NSLayoutConstraint.activate([
                rowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                rowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                rowView.heightAnchor.constraint(equalToConstant: height)
            ])

            if let lastView {
                NSLayoutConstraint.activate([
                    rowView.topAnchor.constraint(equalTo: lastView.bottomAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    rowView.topAnchor.constraint(equalTo: containerView.topAnchor)
                ])
            }

            let spacerView = UIView()
            spacerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(spacerView)
            spacerView.backgroundColor = config.colorSpacing
            NSLayoutConstraint.activate([
                spacerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                spacerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                spacerView.heightAnchor.constraint(equalToConstant: gutter),
                spacerView.topAnchor.constraint(equalTo: rowView.bottomAnchor)
            ])
            lastView = spacerView
            offset += Float(height) + Float(gutter)
        }
    }
}
