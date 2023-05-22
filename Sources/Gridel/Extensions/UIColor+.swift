//
//  UIColor+.swift
//  
//
//  Created by Marko Benačić on 15.05.2023..
//

import UIKit

extension UIColor {

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
