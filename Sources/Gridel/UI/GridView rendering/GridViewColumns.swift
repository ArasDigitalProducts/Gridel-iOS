//
//  GridViewColumns.swift
//  
//
//  Created by Marko Benačić on 26.04.2023..
//

import UIKit

class GridViewColumns: UIView {

    private let containerView = UIView()
    private let stackView = UIStackView()
    private var config: ColumnsConfiguration?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        renderViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with config: ColumnsConfiguration) {
        self.config = config

        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        stackView.spacing = CGFloat(config.gutterSize)

        (0...config.columnCount).forEach { _ in
            let columnView = UIView()
            columnView.backgroundColor = config.color
            stackView.addArrangedSubview(columnView)
        }
    }

    private func setupUI() {
        stackView.axis = .horizontal
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
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(config.marginSize)),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-config.marginSize)),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }



//    override func draw(_ rect: CGRect) {
//        // plaese make sure that the pixels dont overlap
//        guard let config else { return }
//
//        let margin = Float(config.marginSize)
//        let columns = config.columnCount
//        let gutter = Float(config.gutterSize)
//
//        guard margin > 0, columns > 0, gutter > 0 else { return }
//
//        layer.opacity = config.opacity
//
//        let context = UIGraphicsGetCurrentContext()
//
//        //columns
//        let startMarginRect = CGRect(x: 0, y: 0, width: CGFloat(margin), height: bounds.height)
//        context?.setFillColor(config.colorSpacing.cgColor)
//        context?.fill(startMarginRect)
//
//        let endMarginRect = CGRect(x: bounds.width - CGFloat(margin), y: 0, width: CGFloat(margin), height: bounds.height)
//        context?.fill(endMarginRect)
//
//        let columnWidth = (bounds.width - 2 * CGFloat(margin) - CGFloat(columns - 1) * CGFloat(gutter)) / CGFloat(columns)
//
//        var xStart = CGFloat(margin)
//
//        for _ in 1...(columns - 1) {
//            let columnRect = CGRect(x: xStart, y: 0, width: columnWidth, height: bounds.height)
//            context?.setFillColor(config.color.cgColor)
//            context?.fill(columnRect)
//            xStart = xStart + columnWidth
//
//            let gutterRect = CGRect(x: xStart, y: 0, width: CGFloat(gutter), height: bounds.height)
//            context?.setFillColor(config.colorSpacing.cgColor)
//            context?.fill(gutterRect)
//            xStart = xStart + CGFloat(gutter)
//        }
//
//        let columnRect = CGRect(x: xStart, y: 0, width: columnWidth, height: bounds.height)
//        context?.setFillColor(config.color.cgColor)
//        context?.fill(columnRect)
//    }
}
