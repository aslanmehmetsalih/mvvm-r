//
//  MovieDetailRoute.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol MovieDetailRoute: AnyObject {
    func pushMovieDetailController(movie: Movie)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetailController(movie: Movie) {
        let router = MovieDetailRouter()
        let dataProvider = ApiDataProvider()
        let viewModel = MovieDetailViewModel(router: router, dataProvider: dataProvider, movie: movie)
        let viewController = MovieDetailController(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = PushTransition()
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
