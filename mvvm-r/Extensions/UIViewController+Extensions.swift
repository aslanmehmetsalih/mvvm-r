//
//  UIViewController+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func showLoadingDialog() {
        self.view.endEditing(true)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(LoadingDialogHelper.activityData)
    }
    
    func hideLoadingDialog() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
}
