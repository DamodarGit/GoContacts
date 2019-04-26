//
//  Appearence.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

class Appearance {
    static func setup() {
        UIBarButtonItem.appearance()
            .tintColor = Color.green
        
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([
                NSAttributedString.Key.font : Font.su_regular as Any,
                NSAttributedString.Key.foregroundColor : Color.green,
            ],for: .normal)
        
        UINavigationBar.appearance()
            .titleTextAttributes = [NSAttributedString.Key.foregroundColor : Color.gray,
                                    NSAttributedString.Key.font:Font.su_bold as Any]
        
    }
}
