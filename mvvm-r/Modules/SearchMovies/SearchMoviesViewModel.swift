//
//  SearchMoviesViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import ApiDataProvider
import UIComponents

protocol SearchMoviesViewModelDataSource: AnyObject {
    var title: String { get }
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol
}

protocol SearchMoviesViewModelEventSource: AnyObject {
    var setLoading: BoolClosure? { get set }
    var didSuccessFetchMovies: EmptyClosure? { get set }
}

protocol SearchMoviesViewModelProtocol: SearchMoviesViewModelDataSource, SearchMoviesViewModelEventSource {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    func didSelectItem(at indexPath: IndexPath)
}

final class SearchMoviesViewModel: SearchMoviesViewModelProtocol {
    
    var title: String {
        return "Movieee"
    }
    
    var setLoading: BoolClosure?
    var didSuccessFetchMovies: EmptyClosure?
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    private var page = 0
    private var keyword: String?
    private var movies: [Movie] = []
    private var cellItems: [MovieCellProtocol] = []
    
    private let router: SearchMoviesRouter
    private let dataProvider: DataProviderProtocol
    
    init(router: SearchMoviesRouter, dataProvider: DataProviderProtocol) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.keyword = searchBar.text
        fetchMovies(page: 0)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        router.pushMovieDetailController(movie: movie)
    }
    
    func fetchMovies(page: Int) {
        guard let keyword = self.keyword, keyword.count > 1 else {
            SnackHelper.showSnack(message: "Lütfen en az 2 karakter giriniz.")
            return
        }
        if page == 0 {
            setLoading?(true)
        }
        let request = SearchMovieRequest(keyword: keyword, page: page + 1)
        dataProvider.getData(for: request) { [weak self] (result) in
            guard let self = self else { return }
            if page == 0 {
                self.setLoading?(false)
            }
            switch result {
            case .success(let response):
                if page == 0 {
                    self.movies.removeAll()
                    self.cellItems.removeAll()
                }
                self.page = page + 1
                if let search = response.search {
                    self.movies.append(contentsOf: search)
                    let cellItems = search.map({ MovieCellViewModel(movie: $0) })
                    self.cellItems.append(contentsOf: cellItems)
                }
                self.didSuccessFetchMovies?()
            case .failure(let error):
                if page == 0 {
                    SnackHelper.showSnack(message: error.localizedDescription)
                }
            }
        }
    }
    
}
