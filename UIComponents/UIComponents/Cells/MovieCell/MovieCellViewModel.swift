//
//  MovieCellViewModel.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation

public protocol MovieCellDataSource: AnyObject {
    var imdbId: String? { get }
    var imageUrl: URL? { get }
    var title: String? { get }
    var subtitle: String? { get }
    var year: String? { get }
}

public protocol MovieCellProtocol: MovieCellDataSource {}

public class MovieCellViewModel: MovieCellProtocol {
    
    public var imdbId: String?
    public var imageUrl: URL?
    public var title: String?
    public var subtitle: String?
    public var year: String?
    
    public init() {}
    
}
