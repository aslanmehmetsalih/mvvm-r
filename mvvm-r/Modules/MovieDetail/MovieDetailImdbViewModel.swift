//
//  MovieDetailImdbViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation
import DataProvider

protocol MovieDetailImdbViewDataSource: AnyObject {
    
    var rating: String? { get }
    var votes: String? { get }
    var runtime: String? { get }
    
}

protocol MovieDetailImdbViewProtocol: MovieDetailImdbViewDataSource {}

class MovieDetailImdbViewModel: MovieDetailImdbViewProtocol {
    
    var rating: String?
    var votes: String?
    var runtime: String?
    
    init(movieDetail: MovieDetail) {
        rating = movieDetail.imdbRating
        votes = movieDetail.imdbVotes
        runtime = movieDetail.runtime
    }
    
}
