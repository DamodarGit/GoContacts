//
//  View.swift
//  GoContacts
//
//  Created by Damodar, Namala (623-Extern) on 27/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import UIKit



class Loader {
    private var indiacator = UIActivityIndicatorView(style: .whiteLarge)
    private let overlayView : UIView!
    
    init(view : UIView) {
        self.overlayView = UIView.init(frame: view.frame)
        self.overlayView.backgroundColor = Color.lightGrey.withAlphaComponent(0.1)
        view.addSubview(self.overlayView)
        
    }
    
    func show() {
        indiacator.startAnimating()
        indiacator.color = Color.green
        self.overlayView.addSubview(indiacator)
        indiacator.center = self.overlayView.center
    }
    
    func hide() {
        self.indiacator.stopAnimating()
        self.indiacator.removeFromSuperview()
        self.overlayView.removeFromSuperview()
    }
}

class ViewBorderd: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = Color.borderColor.cgColor
        
    }
}
