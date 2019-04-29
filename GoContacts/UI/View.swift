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

enum BannerView {
    case success
    case failed
}

extension UIView {
    func showBanner(_ type: BannerView, _ title: String) {
        DispatchQueue.main.async {
            let window = UIApplication.shared.windows.first
            let rect = CGRect(x: 0, y: -75, width: Int((window?.bounds.width)!), height: 75)
            
            let view = UIView(frame: rect)
            window?.addSubview(view)
            view.backgroundColor = Color.white.withAlphaComponent(1)
            view.layer.borderColor = Color.green.cgColor
            view.layer.borderWidth = 1
            view.layer.zPosition = 1
            let label = UILabel(frame: CGRect(x: 54, y: 21, width: view.frame.size.width - 100, height: 44))
            label.numberOfLines = 3
            view.addSubview(label)
            label.text = title
            
            let image: UIImage?
            
            switch type {
            case .success:
                image = UIImage(named: "success")
                label.textColor = Color.green
            case .failed:
                image = UIImage(named: "failed")
                label.textColor = Color.lightGrey
            }
            
            let imageview  = UIImageView(image: image)
            view.addSubview(imageview)
            imageview.frame = CGRect(x: 8, y: 24, width: 34, height: 34)
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 4, options: .curveEaseOut, animations: {
                let rect = CGRect(x: 0, y: 0, width: Int((window?.bounds.width)!), height: 75)
                view.frame = rect
                
            }) { (done) in
                self.layoutIfNeeded()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2500)) {
                view.removeFromSuperview()
            }

    }
}
}
