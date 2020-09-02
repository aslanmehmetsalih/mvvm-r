//
//  SearchMoviesRoute.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol SearchMoviesRoute: AnyObject {
    func placeOnWindowSearchMoviesController()
}

extension SearchMoviesRoute where Self: RouterProtocol {
    
    func placeOnWindowSearchMoviesController() {
        let router = SearchMoviesRouter()
        let dataProvider = ApiDataProvider(omdbApiKey: Configuration.shared.omdbApiKey)
        let viewModel = SearchMoviesViewModel(router: router, dataProvider: dataProvider)
        let viewController = SearchMoviesController(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = PlaceOnWindowTransition()
        router.openTransition = transition
        
        let navigationController = BaseNavigationController(rootViewController: viewController)
        open(navigationController, transition: transition)
    }
}
