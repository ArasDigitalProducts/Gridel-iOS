//
//  GridViewRows.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class GridViewRows: UIView {

    private var config: RowsConfiguration?
    
    func setup(with config: RowsConfiguration) {
        self.config = config
    }

    override func draw(_ rect: CGRect) {
        guard let config else { return }

        let height = CGFloat(Float(config.height))
        guard height > 0 else { return }

//        layer.opacity = config.opacity

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
}
