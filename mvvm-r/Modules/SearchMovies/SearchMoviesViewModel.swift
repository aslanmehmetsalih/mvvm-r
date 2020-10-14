//
//  SearchMoviesViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

protocol SearchMoviesViewModelDataSource: AnyObject {
    var title: String { get }
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol
}

protocol SearchMoviesViewModelEventSource: AnyObject {
    var fetchMoviesDidSuccess: EmptyClosure? { get set }
}

protocol SearchMoviesViewModelProtocol: SearchMoviesViewModelDataSource, SearchMoviesViewModelEventSource {
    func searchBarSearchButtonClicked(_ searchText: String?)
    func didSelectItem(at indexPath: IndexPath)
}

final class SearchMoviesViewModel: BaseViewModel<SearchMoviesRouter>, SearchMoviesViewModelProtocol {
    
    var title: String {
        return "Movieee"
    }
    
    var fetchMoviesDidSuccess: EmptyClosure?
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> MovieCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    private var page = 0
    private var keyword: String?
    private var cellItems: [MovieCellProtocol] = []
    
    func searchBarSearchButtonClicked(_ searchText: String?) {
        self.keyword = searchText
        fetchMovies(page: 0)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let imdbId = cellItems[indexPath.row].imdbId else { return }
        router.pushMovieDetailController(imdbId: imdbId)
    }
    
    func fetchMovies(page: Int) {
        guard let keyword = self.keyword, keyword.count > 1 else {
            SnackHelper.showSnack(message: "Lütfen en az 2 karakter giriniz.")
            return
        }
        if page == 0 {
            showLoading?()
        }
        let request = SearchMovieRequest(keyword: keyword, page: page + 1)
        dataProvider.getData(for: request) { [weak self] (result) in
            guard let self = self else { return }
            if page == 0 {
                self.hideLoading?()
            }
            switch result {
            case .success(let response):
                if page == 0 {
                    self.cellItems.removeAll()
                }
                self.page = page + 1
                if let search = response.search {
                    let cellItems = search.map({ MovieCellViewModel(movie: $0) })
                    self.cellItems.append(contentsOf: cellItems)
                }
                self.fetchMoviesDidSuccess?()
            case .failure(let error):
                if page == 0 {
                    SnackHelper.showSnack(message: error.localizedDescription)
                }
            }
        }
    }
    
}
