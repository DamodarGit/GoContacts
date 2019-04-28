//
//  Contact.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 27/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation

struct Contact: Codable, Hashable {
    var first_name: String?
    var last_name: String?
    var email: String?
    var mobile: String?
    var phone_number: String?
    var favorite: Bool?
    var id: Int?
    var profile_pic:String?
}


struct ContactRequest: Codable {
    var id: Int!
}
