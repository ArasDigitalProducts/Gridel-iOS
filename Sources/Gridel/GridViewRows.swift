//
//  GridViewRows.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class GridViewRows: UIView {

    private var config: SimpleConfiguration?
    
    func setup(with config: SimpleConfiguration) {
        self.config = config
    }

    override func draw(_ rect: CGRect) {
        //        guard let configStyle else { return }
        //
        //        switch configStyle {
        //        case .simple(let config):
        //            drawSimple(rect, config: config)
        //        case .verbose(let config):
        //            drawVerbose(rect, config: config)
        //        }
        guard let config else { return }

        let height = CGFloat(Float(config.height))
        guard height > 0 else { return }

        layer.opacity = config.opacity

        var swapColors = true
        let context = UIGraphicsGetCurrentContext()
        for y in stride(from: 0, to: bounds.height, by: height) {
            if swapColors {
                context?.setFillColor(config.colorPrimary.cgColor)
            } else {
                context?.setFillColor(config.colorSpacing.cgColor)
            }
            swapColors.toggle()
            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)
            context?.fill(rowRect)
        }

    }

//    func drawSimple(_ rect: CGRect, config: SimpleConfiguration) {
//        let height = CGFloat(Float(config.height))
//        guard height > 0 else { return }
//
//        layer.opacity = config.opacity
//
//        var swapColors = true
//        let context = UIGraphicsGetCurrentContext()
//        for y in stride(from: 0, to: bounds.height, by: height) {
//            if swapColors {
//                context?.setFillColor(config.colorPrimary.cgColor)
//            } else {
//                context?.setFillColor(config.colorSpacing.cgColor)
//            }
//            swapColors.toggle()
//            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)
//            context?.fill(rowRect)
//        }
//    }

//    func drawVerbose(_ rect: CGRect, config: VerboseConfiguration) {
//        // plaese make sure that the pixels dont overlap
//        // and implement rows also
//
//        let margin = Float(config.marginSize)
//        let columns = config.columnCount
//        let gutter = Float(config.gutterSize)
//        let height = CGFloat(Float(config.rowHeight))
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
//            context?.setFillColor(config.colorPrimary.cgColor)
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
//        context?.setFillColor(config.colorPrimary.cgColor)
//        context?.fill(columnRect)
//
//    }


}
