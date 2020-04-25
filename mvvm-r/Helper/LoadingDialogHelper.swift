//
//  LoadingDialogHelper.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingDialogHelper {
    
    static let activityData = ActivityData()

    static func setup() {
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor.black.withAlphaComponent(0.25)
        NVActivityIndicatorView.DEFAULT_TYPE = .ballPulse
        NVActivityIndicatorView.DEFAULT_PADDING = 0.0
        NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = CGSize(width: 50, height: 35)
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.white
    }
    
}
