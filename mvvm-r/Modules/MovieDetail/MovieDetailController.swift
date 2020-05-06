//
//  MovieDetailController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

final class MovieDetailController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var topView: MovieDetailTopView = {
        let view = MovieDetailTopView()
        view.height(150)
        return view
    }()
    private let imdbView = MovieDetailImdbView()
    private let imdbButton = ImdbButton()
    private let avardsView = InfoView()
    private let actorsView = InfoView()
    private let releasedView = InfoView()
    private let writerView = InfoView()
    private let directorView = InfoView()
    private let productionView = InfoView()
    
    let viewModel: MovieDetailProtocol
    
    init(viewModel: MovieDetailProtocol) {
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
        addSubViews()
        setupViews()
        setViewModelEvents()
        viewModel.viewDidLoad()
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.leadingToSuperview()
        scrollView.trailingToSuperview()
        scrollView.topToSuperview(usingSafeArea: true)
        scrollView.bottomToSuperview()
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.width(to: scrollView)
        
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        
        stackView.addArrangedSubview(topView)
        stackView.addArrangedSubview(imdbView)
        stackView.addArrangedSubview(imdbButton)
        stackView.addArrangedSubview(avardsView)
        stackView.addArrangedSubview(actorsView)
        stackView.addArrangedSubview(releasedView)
        stackView.addArrangedSubview(writerView)
        stackView.addArrangedSubview(directorView)
        stackView.addArrangedSubview(productionView)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        imdbButton.setTitle("Show on iMDB", for: .normal)
        imdbButton.addTarget(self, action: #selector(imdbButtonTouchUpInside(_:)), for: .touchUpInside)
    }
    
    private func setViewModelEvents() {
        viewModel.setLoading = { [weak self] showLoading in
            showLoading ? self?.showLoadingDialog() : self?.hideLoadingDialog()
        }
        viewModel.didSuccessFetchMovieDetail = { [weak self] in
            self?.topView.set(data: self?.viewModel.topViewModel)
            self?.imdbView.set(data: self?.viewModel.imdbViewModel)
            self?.avardsView.set(data: self?.viewModel.avardsViewModel)
            self?.actorsView.set(data: self?.viewModel.actorsViewModel)
            self?.releasedView.set(data: self?.viewModel.releasedViewModel)
            self?.writerView.set(data: self?.viewModel.writerViewModel)
            self?.directorView.set(data: self?.viewModel.directorViewModel)
            self?.productionView.set(data: self?.viewModel.productionViewModel)
        }
        viewModel.showErrorDialog = { message in
            SnackHelper.showSnack(message: message)
        }
    }
    
}

extension MovieDetailController {
    
    @IBAction private func imdbButtonTouchUpInside(_ sender: Any) {
        viewModel.imdbButtonTouchUpInside()
    }
    
}
