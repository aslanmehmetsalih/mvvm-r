//
//  MovieDetailViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation
import ApiDataProvider

protocol MovieDetailDataSource: AnyObject {
    var topViewModel: MovieDetailTopViewProtocol? { get }
    var imdbViewModel: MovieDetailImdbViewProtocol? { get }
    var avardsViewModel: InfoViewProtocol? { get }
    var actorsViewModel: InfoViewProtocol? { get }
    var releasedViewModel: InfoViewProtocol? { get }
    var writerViewModel: InfoViewProtocol? { get }
    var directorViewModel: InfoViewProtocol? { get }
    var productionViewModel: InfoViewProtocol? { get }
}

protocol MovieDetailEventSource: AnyObject {
    var setLoading: BoolClosure? { get set }
    var didSuccessFetchMovieDetail: EmptyClosure? { get set }
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
    var didSuccessFetchMovieDetail: EmptyClosure?
    
    private let router: MovieDetailRouter
    private let dataProvider: DataProviderProtocol
    private var movie: Movie
    private var movieDetail: MovieDetail?
    
    init(router: MovieDetailRouter, dataProvider: DataProviderProtocol, movie: Movie) {
        self.router = router
        self.dataProvider = dataProvider
        self.movie = movie
    }
    
    func viewDidLoad() {
        guard let imdbId = movie.imdbId else { return }
        setLoading?(true)
        let request = GetMovieDetailRequest(id: imdbId)
        dataProvider.getData(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.setLoading?(false)
            switch result {
            case .success(let response):
                self.set(movieDetail: response)
                self.didSuccessFetchMovieDetail?()
            case .failure(let error):
                SnackHelper.showSnack(message: error.localizedDescription)
            }
        }
    }
    
    func imdbButtonTouchUpInside() {
        guard let imdbId = movie.imdbId else { return }
        router.openIMDB(imdbId: imdbId)
    }
    
    private func set(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
        topViewModel = MovieDetailTopViewModel(movieDetail: movieDetail)
        
        imdbViewModel = MovieDetailImdbViewModel(movieDetail: movieDetail)
        
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
