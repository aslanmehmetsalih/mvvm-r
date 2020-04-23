//
//  MovieType.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

enum MovieType: String, Decodable {
    case movie      = "movie"
    case series     = "series"
    case episode    = "episode"
    case game       = "game"
}
