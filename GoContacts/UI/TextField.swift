//
//  TextField.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 29/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

class TextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = Font.su_regular
        self.textColor = Color.gray
    }
}
