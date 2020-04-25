//
//  MovieDetailViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation

protocol MovieDetailDataSource: class {
    
    var topViewModel: MovieDetailTopViewProtocol? { get }
    var imdbViewModel: MovieDetailImdbViewProtocol? { get }
    var avardsViewModel: InfoViewProtocol? { get }
    var actorsViewModel: InfoViewProtocol? { get }
    var releasedViewModel: InfoViewProtocol? { get }
    var writerViewModel: InfoViewProtocol? { get }
    var directorViewModel: InfoViewProtocol? { get }
    var productionViewModel: InfoViewProtocol? { get }
    
}

protocol MovieDetailEventSource: class {
    
    var setLoading: BoolClosure? { get set }
    var didSuccessFetchMovieDetail: EmptyClosure? { get set }
    var showErrorDialog: StringClosure? { get set }
    
}

protocol MovieDetailProtocol: MovieDetailDataSource, MovieDetailEventSource {
    
    func viewDidLoad()
    func imdbButtonTouchUpInside()
    
}

final class MovieDetailViewModel: MovieDetailProtocol {
    
    var topViewModel: MovieDetailTopViewProtocol?
    var imdbViewModel: MovieDetailImdbViewProtocol?
    var avardsViewModel: InfoViewProtocol?
    var actorsViewModel: InfoViewProtocol?
    var releasedViewModel: InfoViewProtocol?
    var writerViewModel: InfoViewProtocol?
    var directorViewModel: InfoViewProtocol?
    var productionViewModel: InfoViewProtocol?
    
    var setLoading: BoolClosure?
    var showErrorDialog: StringClosure?
    var didSuccessFetchMovieDetail: EmptyClosure?
    
    let router: MovieDetailRouter?
    private var movie: Movie
    private var movieDetail: MovieDetail?
    
    init(router: MovieDetailRouter, movie: Movie) {
        self.router = router
        self.movie = movie
    }
    
    func viewDidLoad() {
        guard let imdbId = movie.imdbId else { return }
        setLoading?(true)
        let request = GetMovieDetailRequest(id: imdbId)
        request.fetch(success: { [weak self] (response) in
            self?.set(movieDetail: response)
            self?.didSuccessFetchMovieDetail?()
            self?.setLoading?(false)
        }) { [weak self] (error) in
            self?.setLoading?(false)
            self?.showErrorDialog?(error.message ?? "")
        }
    }
    
    func imdbButtonTouchUpInside() {
        guard let imdbId = movie.imdbId else { return }
        router?.openIMDB(imdbId: imdbId)
    }
    
    private func set(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
        topViewModel = MovieDetailTopViewModel(with: movieDetail)
        
        imdbViewModel = MovieDetailImdbViewModel(with: movieDetail)
        
        let avardsViewModel = InfoViewModel()
        avardsViewModel.title = "Avards"
        avardsViewModel.subtitle = movieDetail.awards
        self.avardsViewModel = avardsViewModel
        
        let actorsViewModel = InfoViewModel()
        actorsViewModel.title = "Actors"
        actorsViewModel.subtitle = movieDetail.actors
        self.actorsViewModel = actorsViewModel
        
        let releasedViewModel = InfoViewModel()
        releasedViewModel.title = "Released"
        releasedViewModel.subtitle = movieDetail.released
        self.releasedViewModel = releasedViewModel
        
        let writerViewModel = InfoViewModel()
        writerViewModel.title = "Writer"
        writerViewModel.subtitle = movieDetail.writer
        self.writerViewModel = writerViewModel
        
        let directorViewModel = InfoViewModel()
        directorViewModel.title = "Director"
        directorViewModel.subtitle = movieDetail.director
        self.directorViewModel = directorViewModel
        
        let productionViewModel = InfoViewModel()
        productionViewModel.title = "Production"
        productionViewModel.subtitle = movieDetail.production
        self.productionViewModel = productionViewModel
    }
    
}
