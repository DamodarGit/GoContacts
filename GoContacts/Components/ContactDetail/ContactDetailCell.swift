//
//  ContactDetailCell.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 29/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation
import UIKit

class ContactDetailCell : UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    static let identifier = "ContactDetailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        self.keyLabel.type(.regular)
        self.keyLabel.textColor = Color.lightGrey
        self.valueLabel.type(.regular)
        self.valueLabel.textColor = Color.gray
    }
    
    func configure(_ key : String, value: String)  {
        self.keyLabel.text = key
        self.valueLabel.text = value
    }
}
