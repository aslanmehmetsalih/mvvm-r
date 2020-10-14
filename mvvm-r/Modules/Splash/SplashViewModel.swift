//
//  SplashViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

protocol SplashViewModelProtocol: AnyObject {
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel<SplashRouter>, SplashViewModelProtocol {
    
    override func viewDidLoad() {
        router.placeOnWindowSearchMoviesController()
    }
    
}
