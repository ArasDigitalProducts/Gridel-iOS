//
//  GridView.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class GridView: UIView {

    private var configStyle: ConfigStyle?
    
    func setup(with configStyle: ConfigStyle) {
        self.configStyle = configStyle
    }

    override func draw(_ rect: CGRect) {
        guard let configStyle else { return }

        switch configStyle {
        case .simple(let config):
            drawSimple(rect, config: config)
        case .verbose(let config):
            drawVerbose(rect, config: config)
        }
    }

    func drawSimple(_ rect: CGRect, config: SimpleConfiguration) {
        let height = CGFloat(Float(config.height))
        guard height > 0 else { return }

        layer.opacity = config.opacity

        var swapColors = true
        let context = UIGraphicsGetCurrentContext()
        for y in stride(from: 0, to: bounds.height, by: height) {
            swapColors ? context?.setFillColor(config.colorPrimary.cgColor) : context?.setFillColor(config.colorSpacing.cgColor)
            swapColors.toggle()
            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)
            context?.fill(rowRect)
        }
    }

    func drawVerbose(_ rect: CGRect, config: VerboseConfiguration) {

    }


}
