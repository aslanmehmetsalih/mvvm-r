//
//  MovieDetailRoute.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol MovieDetailRoute: AnyObject {
    func pushMovieDetailController(imdbId: String)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetailController(imdbId: String) {
        let router = MovieDetailRouter()
        let dataProvider = ApiDataProvider(omdbApiKey: Configuration.shared.omdbApiKey)
        let viewModel = MovieDetailViewModel(router: router, dataProvider: dataProvider, imdbId: imdbId)
        let viewController = MovieDetailController(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = PushTransition()
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
