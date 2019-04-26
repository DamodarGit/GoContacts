//
//  Label.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

@IBDesignable
class Label: UILabel {
    
    @IBInspectable var type: Int = 0 {
        didSet(type) {
            switch type {
            case 1:
                self.textColor = Color.gray
            default:
                self.textColor = Color.lightGrey
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.su_regular

        switch self.type {
        case 1:
            self.textColor = Color.gray
        default:
            self.textColor = Color.lightGrey
        }
    }
}
