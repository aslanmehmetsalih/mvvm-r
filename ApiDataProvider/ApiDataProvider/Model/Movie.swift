//
//  Movie.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public struct Movie: Decodable {
    
    public let title: String?
    public let year: String?
    public let imdbId: String?
    public let type: MovieType?
    public let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title      = "Title"
        case year       = "Year"
        case imdbId     = "imdbID"
        case type       = "Type"
        case poster     = "Poster"
    }
    
}
