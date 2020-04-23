//
//  MovieDetail.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

struct MovieDetail: Decodable {
    
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let poster: String?
    let ratings: [MovieRating]?
    let metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let type: MovieType?
    let totalSeasons: String?
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let response: String?
    
    enum CodingKeys: String, CodingKey {
        case title          = "Title"
        case year           = "Year"
        case rated          = "Rated"
        case released       = "Released"
        case runtime        = "Runtime"
        case genre          = "Genre"
        case director       = "Director"
        case writer         = "Writer"
        case actors         = "Actors"
        case plot           = "Plot"
        case language       = "Language"
        case country        = "Country"
        case awards         = "Awards"
        case poster         = "Poster"
        case ratings        = "Ratings"
        case metascore      = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case type           = "Type"
        case totalSeasons
        case dvd            = "DVD"
        case boxOffice      = "BoxOffice"
        case production     = "Production"
        case website        = "Website"
        case response       = "Response"
    }
    
}
