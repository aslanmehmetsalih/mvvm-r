//
//  SearchMoviesController.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import TinyConstraints

final class SearchMoviesController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(MovieCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    let viewModel: SearchMoviesViewModelProtocol
    
    init(viewModel: SearchMoviesViewModelProtocol) {
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
    }
        
    private func addSubViews() {
        navigationItem.searchController = searchController
        
        view.addSubview(collectionView)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.topToSuperview(usingSafeArea: true)
        collectionView.bottomToSuperview()
    }
    
    private func setupViews() {
        navigationItem.title = viewModel.title
        view.backgroundColor = .white
    }
    
    private func setViewModelEvents() {
        viewModel.setLoading = { [weak self] showLoading in
            showLoading ? self?.showLoadingDialog() : self?.hideLoadingDialog()
        }
        viewModel.didSuccessFetchMovies = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.showErrorDialog = { message in
            SnackHelper.showSnack(message: message)
        }
    }
    
}

extension SearchMoviesController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarSearchButtonClicked(searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarCancelButtonClicked(searchBar)
    }
    
}

extension SearchMoviesController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
    
}

extension SearchMoviesController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = viewModel.numberOfItems
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(for: indexPath)
        let item = viewModel.cellItem(for: indexPath)
        cell.set(data: item)
        return cell
    }
    
}

//swiftlint:disable line_length
extension SearchMoviesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        if UIDevice.current.userInterfaceIdiom == .pad {
            let cellWidth = (width - 60) / 2
            return CGSize(width: cellWidth, height: 120)
        } else {
            let cellWidth = width - 40
            return CGSize(width: cellWidth, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
//swiftlint:enable line_length
