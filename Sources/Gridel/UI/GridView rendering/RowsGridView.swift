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
        setupUI()
        renderViews()
    }

    private func setupUI() {
        guard let config else { return }
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        var offset: Float = 0
        let height = CGFloat(Float(config.height))
        let gutter = CGFloat(Float(config.gutterSize))
        while offset < Float(frame.height) {
            let rowView = UIView()
            containerView.addSubview(rowView)
            rowView.backgroundColor = .orange
            NSLayoutConstraint.activate([
                rowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                rowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                rowView.heightAnchor.constraint(equalToConstant: height)
            ])
            let spacerView = UIView()
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
