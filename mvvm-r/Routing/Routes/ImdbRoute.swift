//
//  ImdbRoute.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol ImdbRoute: class {
    func openIMDB(imdbId: String)
}

extension ImdbRoute where Self: RouterProtocol {
    
    func openIMDB(imdbId: String) {
        let imdbUrl = "https://www.imdb.com/title/" + imdbId
        if let url = URL(string: imdbUrl), UIApplication.shared.canOpenURL(url) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
