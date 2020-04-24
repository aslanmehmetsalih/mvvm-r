//
//  BaseNavigationController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = .white
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .black
        navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16, weight: .semibold),
                                             .foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .normal)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16, weight: .semibold),
                                              .foregroundColor: UIColor.black]
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
    }
    
}
