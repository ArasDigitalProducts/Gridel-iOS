//
//  CGFloat+Extensions.swift
//  
//
//  Created by Marko Benačić on 24.05.2023..
//

import Foundation

extension CGFloat {
    func roundTo(decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self) as String
    }

    func toPercentageString() -> String {
        let percentage = self * 100
        return percentage.roundTo(decimalPlaces: 0) + "%"
    }
}
