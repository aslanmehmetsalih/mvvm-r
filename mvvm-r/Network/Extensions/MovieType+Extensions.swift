//
//  MovieType+Extensions.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

extension MovieType {
    
    var displayName: String {
        switch self {
        case .movie:
            return "Movie"
        case .game:
            return "Game"
        case .series:
            return "Series"
        case .episode:
            return "Episode"
        }
    }
    
}
