//
//  PlaceOnWindowTransition.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class PlaceOnWindowTransition: Transition {
    
    var viewController: UIViewController?
    
    func open(_ viewController: UIViewController) {
        guard let window = UIApplication.shared.windows.first else { return }
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation {
                window.rootViewController = viewController
            }
        }, completion: nil)
    }
    
    func close(_ viewController: UIViewController) {}
    
}
