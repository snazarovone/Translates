//
//  Colors.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

// swiftlint:disable all
fileprivate func pushLowerByte(number: inout Int) -> Int {
    let byte = number & 0xff
    number >>= 8
    return byte
}

extension UIColor {

    convenience init(argb number: Int) {
        var mask = number
        let b = CGFloat(pushLowerByte(number: &mask)) / 255
        let g = CGFloat(pushLowerByte(number: &mask)) / 255
        let r = CGFloat(pushLowerByte(number: &mask)) / 255
        let a = CGFloat(pushLowerByte(number: &mask)) / 255
        self.init(red: r, green: g, blue: b, alpha: a)
    }

    convenience init(rgb number: Int) {
        self.init(argb: number | 0xff000000)
    }

    static let tBlack = UIColor(rgb: 0x352C38)
    static let tWhite = UIColor(rgb: 0xFFFFFF)
    static let tGrey = UIColor(rgb: 0x808A9B)
    static let tBlue = UIColor(rgb: 0x5799DB)
}
// swiftlint:enable all
