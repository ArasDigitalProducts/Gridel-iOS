//
//  GridViewRows.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class RowsGridView: UIView {

    private var config: RowsConfiguration?
    
    func setup(with config: RowsConfiguration) {
        self.config = config
    }

    override func draw(_ rect: CGRect) {
        guard let config else { return }

        let height = CGFloat(Float(config.height))
        let gutter = CGFloat(Float(config.gutterSize))
        guard height > 0, gutter > 0 else { return }

        layer.opacity = config.opacity

        let context = UIGraphicsGetCurrentContext()
        for y in stride(from: 0, to: bounds.height, by: height + gutter) {
            context?.setFillColor(config.colorPrimary.cgColor)
            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)
            context?.fill(rowRect)

            context?.setFillColor(config.colorSpacing.cgColor)
            let spacingRect = CGRect(x: 0, y: CGFloat(y + height), width: bounds.width, height: gutter)
            context?.fill(spacingRect)
        }

    }
}
