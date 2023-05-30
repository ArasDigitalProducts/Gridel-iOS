//
//  UIColor+Extensions.swift
//  
//
//  Created by Marko Benačić on 15.05.2023..
//

import UIKit

extension UIColor {

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"%06x", rgb)
    }

    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            return (red, green, blue, alpha)
    }


    static var blackBackground: UIColor {
        return UIColor(named: "blackBackground", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var p50: UIColor {
        return UIColor(named: "P50", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var p75: UIColor {
        return UIColor(named: "P75", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var p100: UIColor {
        return UIColor(named: "P100", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var p200: UIColor {
        return UIColor(named: "P200", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var p300: UIColor {
        return UIColor(named: "P300", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var g75: UIColor {
        return UIColor(named: "G75", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var g400: UIColor {
        return UIColor(named: "G400", in: Bundle.module, compatibleWith: nil) ?? .red
    }

    static var g500: UIColor {
        return UIColor(named: "G500", in: Bundle.module, compatibleWith: nil) ?? .red
    }

}
