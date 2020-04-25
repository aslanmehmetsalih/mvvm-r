//
//  SearchMoviesRoute.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol SearchMoviesWindowRoute: class {
    var searchMoviesTransition: Transition { get }
    func openSearchMoviesController()
}

extension SearchMoviesWindowRoute where Self: RouterProtocol {
    
    var searchMoviesTransition: Transition {
        return PlaceOnWindowTransition()
    }
    
    func openSearchMoviesController() {
        let router = SearchMoviesRouter()
        let viewModel = SearchMoviesViewModel(router: router)
        let viewController = SearchMoviesController(viewModel: viewModel)
        router.viewController = viewController
        
        let transition = searchMoviesTransition
        router.openTransition = transition
        
        let navigationController = BaseNavigationController(rootViewController: viewController)
        open(navigationController, transition: transition)
    }
}
