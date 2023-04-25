//
//  GridView.swift
//  
//
//  Created by Marko Benačić on 25.04.2023..
//

import UIKit

class GridView: UIView {
    
    func setup(with configStyle: ConfigStyle) {

        switch configStyle {
        case .simple(let config):
            setupSimple(with: config)
        case .verbose(let config):
            setupVerbose(with: config)
        }

    }


    func setupSimple(with config: SimpleConfiguration) {
//        backgroundColor = .lightGray
        layer.opacity = config.opacity


    }

    func setupVerbose(with config: VerboseConfiguration) {
//        backgroundColor = .lightGray
        layer.opacity = config.opacity
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        // Set the fill color to white
        context?.setFillColor(UIColor.white.cgColor)

        // Loop through the height of the view in increments of 8 points
        for y in stride(from: 0, to: bounds.height, by: 8) {
            // If the row number is even, set the fill color to red
            if y.remainder(dividingBy: 8) == 0 {
                context?.setFillColor(UIColor.red.cgColor)
            }

            // Create a rectangle for the row
            let rowRect = CGRect(x: 0, y: CGFloat(y), width: bounds.width, height: 8)

            // Fill the rectangle with the current fill color
            context?.fill(rowRect)
        }
    }

}
