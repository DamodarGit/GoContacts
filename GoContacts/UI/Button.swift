//
//  Button.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 28/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

class Button: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Font.su_regular
        self.tintColor = Color.green
    }
    
}
