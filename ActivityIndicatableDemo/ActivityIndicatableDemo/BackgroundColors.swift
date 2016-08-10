//
//  BackgroundColors.swift
//  ActivityIndicatableDemo
//
//  Created by Quentin Ribierre on 7/29/16.
//  Copyright © 2016 Prolific Interactive Corp. All rights reserved.
//

import UIKit

internal enum BackgroundColorType {
    case Light
    case Dark

    func randomColor() -> UIColor? {
        switch self {
        case .Light:
            return LightBackgroundColor.randomColor()
        case .Dark:
            return DarkBackgroundColor.randomColor()
        }
    }
}

private protocol BackgroundColor {

    static var allValues: [Self] { get }

    static func randomColor() -> UIColor?

    func color() -> UIColor?

}

private extension BackgroundColor {

    static func randomColor() -> UIColor? {
        let count = UInt32(allValues.count)
        let randomIndex = Int(arc4random_uniform(count))
        return allValues[randomIndex].color()
    }

}

private enum LightBackgroundColor: BackgroundColor {

    case Gray2
    case ProlificGreen
    case StrongYellow

    static let allValues: [LightBackgroundColor] = [.Gray2, .ProlificGreen, .StrongYellow]

    func color() -> UIColor? {
        switch self {
        case .Gray2:
            return UIColor(hexString: "#DFE7ED", alpha: 1.0)
        case .ProlificGreen:
            return UIColor(hexString: "#47F5BE", alpha: 1.0)
        case .StrongYellow:
            return UIColor(hexString: "#FFF768", alpha: 1.0)
        }
    }
}

private enum DarkBackgroundColor: BackgroundColor {

    case Gray8
    case ProlificNeueBlue
    case HotSalmon

    static let allValues: [DarkBackgroundColor] = [.Gray8, .ProlificNeueBlue, .HotSalmon]

    func color() -> UIColor? {
        switch self {
        case .Gray8:
            return UIColor(hexString: "#3E586B", alpha: 1.0)
        case .ProlificNeueBlue:
            return UIColor(hexString: "#0093FF", alpha: 1.0)
        case .HotSalmon:
            return UIColor(hexString: "#FD5E43", alpha: 1.0)
        }
    }
}

private extension UIColor {

    /**
     Create non-autoreleased color with in the given hex string and alpha.

     - parameter hexString: hexString
     - parameter alpha:     alpha

     - returns: Color with the given hex string and alpha.
     */
    private convenience init?(hexString: String, alpha: Float) {
        var hex = hexString

        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1))
        }

        if (hex.rangeOfString("(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .RegularExpressionSearch) != nil) {

            // Deal with 3 character Hex strings
            if hex.characters.count == 3 {
                let redHex   = hex.substringToIndex(hex.startIndex.advancedBy(1))
                let greenHex = hex.substringWithRange(hex.startIndex.advancedBy(1) ..< hex.startIndex.advancedBy(2))
                let blueHex  = hex.substringFromIndex(hex.startIndex.advancedBy(2))

                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }

            let redHex = hex.substringToIndex(hex.startIndex.advancedBy(2))
            let greenHex = hex.substringWithRange(hex.startIndex.advancedBy(2) ..< hex.startIndex.advancedBy(4))
            let blueHex = hex.substringWithRange(hex.startIndex.advancedBy(4) ..< hex.startIndex.advancedBy(6))

            var redInt: CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt: CUnsignedInt = 0

            NSScanner(string: redHex).scanHexInt(&redInt)
            NSScanner(string: greenHex).scanHexInt(&greenInt)
            NSScanner(string: blueHex).scanHexInt(&blueInt)

            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        } else {
            // Note:
            // The swift 1.1 compiler is currently unable to destroy partially initialized classes in all cases,
            // so it disallows formation of a situation where it would have to.  We consider this a bug to be fixed
            // in future releases, not a feature. -- Apple Forum
            self.init()
            return nil
        }
    }
}
