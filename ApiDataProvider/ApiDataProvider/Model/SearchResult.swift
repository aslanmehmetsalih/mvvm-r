//
//  SearchResult.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public struct SearchResult: Decodable {
    
    public let search: [Movie]?
    public let totalResults: String?
    
    enum CodingKeys: String, CodingKey {
        case search         = "Search"
        case totalResults
    }
    
}
