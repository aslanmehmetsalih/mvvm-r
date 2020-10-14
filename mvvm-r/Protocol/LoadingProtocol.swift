//
//  LoadingProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 14.10.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol LoadingProtocol {
    func showLoading()
    func hideLoading()
}

extension LoadingProtocol where Self: UIViewController {
    func showLoading() {
        self.view.endEditing(true)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(LoadingDialogHelper.activityData)
    }
    
    func hideLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
}
