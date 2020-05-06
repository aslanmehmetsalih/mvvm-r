//
//  AppSettingsRoute.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol AppSettingsRoute: AnyObject {
    func openAppSettings()
}

extension AppSettingsRoute {
    func openAppSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                  options: [:],
                                  completionHandler: nil)
    }
}
