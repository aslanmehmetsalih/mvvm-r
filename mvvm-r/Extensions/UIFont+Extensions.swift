//
//  UIFont+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func regular(of size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size)
    }
    
    static func semiBold(of size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size, weight: .semibold)
    }
    
}
