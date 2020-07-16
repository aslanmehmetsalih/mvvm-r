//
//  MovieCellViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation
import ApiDataProvider

public protocol MovieCellDataSource: AnyObject {
    
    var imageUrl: URL? { get }
    var title: String? { get }
    var subtitle: String? { get }
    var year: String? { get }
    
}

public protocol MovieCellProtocol: MovieCellDataSource {}

public class MovieCellViewModel: MovieCellProtocol {
    
    public var imageUrl: URL?
    public var title: String?
    public var subtitle: String?
    public var year: String?
    
    public init(movie: Movie) {
        if let poster = movie.poster {
            imageUrl = URL(string: poster)
        }
        title = movie.title
        subtitle = movie.type?.displayName
        year = movie.year
    }
    
}
