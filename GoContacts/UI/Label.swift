//
//  Label.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

enum FontType {
    case small
    case regular
    case bold
    case semi_bold
}

extension UILabel {
    func type(_ type: FontType) {
        switch type {
        case .bold:
            self.font = Font.su_bold
        case .regular:
            self.font = Font.su_regular
        case .semi_bold:
            self.font = Font.su_semi_bold
        case .small:
            self.font = Font.su_small
        }
    }
}


class Label: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.su_regular
    }
}
