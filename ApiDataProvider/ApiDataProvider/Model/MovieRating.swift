//
//  MovieRating.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public struct MovieRating: Decodable {
    
    public let source: String?
    public let value: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value  = "Value"
    }
}
