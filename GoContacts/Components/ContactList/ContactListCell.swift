//
//  ContactListCell.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 27/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    @IBOutlet weak var imageThumb: UIImageView?
    @IBOutlet weak var labelFullName: UILabel?
    @IBOutlet weak var imageFavourite: UIImageView?

    static let identifier = "ContactListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ contact:Contact) {
        guard let first_name = contact.first_name,
            let lastname = contact.last_name,
            let thumbUrl = contact.profile_pic,
            let isFavourite = contact.favorite else { return }
        
        DispatchQueue.main.async {
            self.imageThumb?.rounded()
            self.imageThumb?.getImagage(url: thumbUrl)
            if isFavourite {
                self.imageFavourite?.image = UIImage(named: "Fav_filled")
            }
            
            let fullName = (first_name + " " + lastname)
            self.labelFullName?.text = "\(fullName)"
        }
    }
}
