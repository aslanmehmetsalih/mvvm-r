//
//  MovieCellViewModel+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 17.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

extension MovieCellViewModel {
    
    convenience init(movie: Movie) {
        self.init()
        imdbId = movie.imdbId
        if let poster = movie.poster {
            imageUrl = URL(string: poster)
        }
        title = movie.title
        subtitle = movie.type?.displayName
        year = movie.year
    }
    
}
