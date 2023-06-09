//
//  GridViewRows.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class RowsGridView: UIView {

    private let containerView = UIView()
    private var config: RowsConfiguration?

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with config: RowsConfiguration) {
        self.config = config
        setupUI2()
        renderViews()
    }

    private func setupUI() {
        guard let config else { return }
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        var offset: Float = 0
        let height = CGFloat(Float(config.height))
        let gutter = CGFloat(Float(config.gutterSize))
        var lastView: UIView?
        while offset < Float(frame.height) {
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

    private func setupUI2() {
        guard let config else { return }

        let scrollView = UIScrollView()
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
        while offset < Float(frame.height) {
            let rowView = UIView()
            rowView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(rowView)
            rowView.backgroundColor = .orange
            NSLayoutConstraint.activate([
                rowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                rowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                rowView.heightAnchor.constraint(equalToConstant: height)
            ])
            let spacerView = UIView()
            spacerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(spacerView)
            spacerView.backgroundColor = .clear
            NSLayoutConstraint.activate([
                spacerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                spacerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                spacerView.heightAnchor.constraint(equalToConstant: gutter)
            ])
            offset += Float(height) + Float(gutter)
        }

    }

    private func renderViews() {

    }

//    override func draw(_ rect: CGRect) {
//        guard let config else { return }
//
//        let height = CGFloat(Float(config.height))
//        let gutter = CGFloat(Float(config.gutterSize))
//        guard height > 0, gutter > 0 else { return }
//
//        layer.opacity = config.opacity
//
//        let context = UIGraphicsGetCurrentContext()
//        for y in stride(from: 0, to: bounds.height, by: height + gutter) {
//            context?.setFillColor(config.colorPrimary.cgColor)
//            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)
//            context?.fill(rowRect)
//
//            context?.setFillColor(config.colorSpacing.cgColor)
//            let spacingRect = CGRect(x: 0, y: CGFloat(y + height), width: bounds.width, height: gutter)
//            context?.fill(spacingRect)
//        }
//
//    }
}
