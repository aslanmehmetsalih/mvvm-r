//
//  ActivityIndicatorProtocol.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 14.10.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

public protocol ActivityIndicatorProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    func showActivityIndicator() {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.tintColor = .gray
        indicator.startAnimating()
        view.addSubview(indicator)
        indicator.centerInSuperview()
        view.bringSubviewToFront(indicator)
    }
    
    func hideActivityIndicator() {
        view.subviews.filter({ $0 is UIActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
}
