//
//  UIColor+Hex.swift
//  GitPatch
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static var anthracite: UIColor {
        return UIColor(rgb: 0x4a4f51)
    }
    
    static var navyBlue: UIColor {
        return UIColor(rgb: 0x2180c2)
    }
    
    static var backgroundGray: UIColor {
        return UIColor(rgb: 0xf2f2f2)
    }
}
