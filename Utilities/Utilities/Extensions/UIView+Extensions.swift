//
//  UIView+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
