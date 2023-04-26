//
//  GridViewColumns.swift
//  
//
//  Created by Marko Benačić on 26.04.2023..
//

import UIKit

class GridViewColumns: UIView{

    private var config: VerboseConfiguration?

    func setup(with config: VerboseConfiguration) {
        self.config = config
    }

    override func draw(_ rect: CGRect) {
        // plaese make sure that the pixels dont overlap
        // and implement rows also
        guard let config else { return }

        let margin = Float(config.marginSize)
        let columns = config.columnCount
        let gutter = Float(config.gutterSize)
        let height = CGFloat(Float(config.rowHeight))

        guard margin > 0, columns > 0, gutter > 0 else { return }

        layer.opacity = config.opacity

        let context = UIGraphicsGetCurrentContext()

        //columns
        let startMarginRect = CGRect(x: 0, y: 0, width: CGFloat(margin), height: bounds.height)
        context?.setFillColor(config.colorSpacing.cgColor)
        context?.fill(startMarginRect)

        let endMarginRect = CGRect(x: bounds.width - CGFloat(margin), y: 0, width: CGFloat(margin), height: bounds.height)
        context?.fill(endMarginRect)

        let columnWidth = (bounds.width - 2 * CGFloat(margin) - CGFloat(columns - 1) * CGFloat(gutter)) / CGFloat(columns)

        var xStart = CGFloat(margin)

        for _ in 1...(columns - 1) {
            let columnRect = CGRect(x: xStart, y: 0, width: columnWidth, height: bounds.height)
            context?.setFillColor(config.colorPrimary.cgColor)
            context?.fill(columnRect)
            xStart = xStart + columnWidth

            let gutterRect = CGRect(x: xStart, y: 0, width: CGFloat(gutter), height: bounds.height)
            context?.setFillColor(config.colorSpacing.cgColor)
            context?.fill(gutterRect)
            xStart = xStart + CGFloat(gutter)
        }

        let columnRect = CGRect(x: xStart, y: 0, width: columnWidth, height: bounds.height)
        context?.setFillColor(config.colorPrimary.cgColor)
        context?.fill(columnRect)
    }
}
