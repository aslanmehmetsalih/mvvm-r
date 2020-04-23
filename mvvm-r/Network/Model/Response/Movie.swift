//
//  Movie.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

struct Movie: Decodable {
    
    let title: String?
    let year: String?
    let imdbID: String?
    let type: MovieType?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title      = "Title"
        case year       = "Year"
        case imdbID
        case type       = "Type"
        case poster     = "Poster"
    }
    
}
