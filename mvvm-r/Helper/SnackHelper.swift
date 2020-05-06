//
//  SnackHelper.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import SwiftEntryKit

class SnackHelper {
    
    class func showSnack(message: String) {
        let contentView = UIView()
        contentView.backgroundColor = .black
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = .regular(of: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = message
        contentView.addSubview(label)
        label.edgesToSuperview(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))

        var attributes = EKAttributes.bottomToast
        attributes.hapticFeedbackType = .success
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        let backgroundColor = EKColor(light: .white, dark: .black)
        attributes.entryBackground = .color(color: backgroundColor)

        SwiftEntryKit.display(entry: contentView, using: attributes)
    }

}
