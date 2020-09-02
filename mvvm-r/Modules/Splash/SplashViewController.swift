//
//  SplashViewController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    
    private weak var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let router = SplashRouter()
        router.viewController = self
        
        let dataProvider = ApiDataProvider(omdbApiKey: Configuration.shared.omdbApiKey)
        let viewModel = SplashViewModel(router: router, dataProvider: dataProvider)
        self.viewModel = viewModel
        
        self.viewModel?.viewDidLoad()
    }
    
}
