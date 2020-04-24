//
//  MovieCellViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation

protocol MovieCellDataSource: class {
    
    var imageUrl: URL? { get }
    var title: String? { get }
    var subtitle: String? { get }
    var year: String? { get }
    
}

protocol MovieCellProtocol: MovieCellDataSource {}

class MovieCellViewModel: MovieCellProtocol {
    
    var imageUrl: URL?
    var title: String?
    var subtitle: String?
    var year: String?
    
    init(with movie: Movie) {
        if let poster = movie.poster {
            imageUrl = URL(string: poster)
        }
        title = movie.title
        subtitle = movie.type?.displayName
        year = movie.year
    }
    
}
