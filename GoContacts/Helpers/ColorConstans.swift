//
//  ColorConstans.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "red color invaid ")
        assert(green >= 0 && green <= 255, " green color invaid")
        assert(blue >= 0 && blue <= 255, " blue color invaid")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

struct Color {
    static let green = UIColor(rgb: 0x50E3C2)
    static let gray = UIColor(rgb: 0x4A4A4A)
    static let white = UIColor.white
    static let lightGrey =  UIColor(rgb: 0x4A4A4A).withAlphaComponent(0.5)
    static let borderColor =  UIColor(rgb: 0xF0F0F0)
    static let clear =  UIColor.clear

}
