//
//  BaseViewController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 14.10.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    //swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subsribeLoading()
        subsribeActivityIndicator()
        viewModel.viewDidLoad()
    }
    
    private func configureContents() {
        view.backgroundColor = .white
    }
    
    private func subsribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.showLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.hideLoading()
        }
    }
    
    private func subsribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
}
