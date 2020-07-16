//
//  SplashViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import DataProvider

protocol SplashViewModelProtocol: AnyObject {
    func viewDidLoad()
}

final class SplashViewModel: SplashViewModelProtocol {
    
    let router: SplashRouter
    let dataProvider: DataProviderProtocol
    
    init(router: SplashRouter, dataProvider: DataProviderProtocol) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        router.placeOnWindowSearchMoviesController()
    }
    
}
