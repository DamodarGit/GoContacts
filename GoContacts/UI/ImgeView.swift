//
//  ImgeView.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 27/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit

extension UIImageView {
    func getImagage(url: String) {
        
        let request =  ContactFetcher.image.from(path: url)
        URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            
            if error == nil {
                if let data = responseData {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
                else {
                    let image = UIImage(named: "icon_user_filled")
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } else {
                let image = UIImage(named: "icon_user_filled")
                DispatchQueue.main.async {
                    self.image = image
                }
                }
            }.resume()
    }
    
    func rounded() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
