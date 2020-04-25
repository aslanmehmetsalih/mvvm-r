//
//  SearchMoviesViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

protocol SearchMoviesViewModelDataSource: class {
    
    var title: String { get }
    var numberOfItems: Int { get }
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol
    
    
}

protocol SearchMoviesViewModelEventSource: class {
    
    var setLoading: BoolClosure? { get set }
    var didSuccessFetchMovies: EmptyClosure? { get set }
    var showErrorDialog: StringClosure? { get set }
    
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
    var showErrorDialog: StringClosure?
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
    
    let router: SearchMoviesRouter?
    
    init(router: SearchMoviesRouter) {
        self.router = router
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
        router?.pushMovieDetailController(movie: movie)
    }
    
    private func fetchMovies(page: Int) {
        guard let keyword = self.keyword, keyword.count > 1 else {
            showErrorDialog?("Lütfen en az 2 karakter giriniz.")
            return
        }
        if page == 0 {
            setLoading?(true)
        }
        let request = SearchMovieRequest(keyword: keyword, page: page+1)
        request.fetch(success: { [weak self] (response) in
            self?.setLoading?(false)
            if page == 0 {
                self?.movies.removeAll()
                self?.cellItems.removeAll()
            }
            self?.page = page+1
            if let search = response.search {
                self?.movies.append(contentsOf: search)
                if let cellItems = response.search?.map({ MovieCellViewModel(with: $0) }) {
                    self?.cellItems.append(contentsOf: cellItems)
                }
            }
            self?.didSuccessFetchMovies?()
        }) { [weak self] (error) in
            self?.setLoading?(false)
            if self?.page == 0 {
                self?.showErrorDialog?(error.message ?? "")
            }
        }
    }
    
}
