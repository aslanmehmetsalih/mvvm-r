//
//  UIImageView+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    static let fadeAnimation = KingfisherOptionsInfoItem.transition(.fade(0.2))
    
    func setImage(_ url: URL?, placeholder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeholder, options: [UIImageView.fadeAnimation])
    }
    
}
