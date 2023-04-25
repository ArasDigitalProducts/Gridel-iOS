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

//        switch configStyle {
//        case .simple(let config):
//            setupSimple(with: config)
//        case .verbose(let config):
//            setupVerbose(with: config)
//        }

    }


//    func setupSimple(with config: SimpleConfiguration) {
////        backgroundColor = .lightGray
//        layer.opacity = config.opacity
//
//
//    }
//
//    func setupVerbose(with config: VerboseConfiguration) {
////        backgroundColor = .lightGray
//        layer.opacity = config.opacity
//    }

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
        layer.opacity = config.opacity

        
        var flag = true

        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(config.colorSpacing.cgColor)
        // Loop through the height of the view in increments of 8 points
        for y in stride(from: 0, to: bounds.height, by: height) {
            if flag {
                context?.setFillColor(config.colorPrimary.cgColor)
                flag = false
            } else {
                context?.setFillColor(config.colorSpacing.cgColor)
                flag = true
            }

            // Create a rectangle for the row
            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: height)

            // Fill the rectangle with the current fill color
            context?.fill(rowRect)
        }
    }

    func drawVerbose(_ rect: CGRect, config: VerboseConfiguration) {

    }


}
