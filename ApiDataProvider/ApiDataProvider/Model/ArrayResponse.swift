//
//  ArrayResponse.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public struct ArrayResponse<ObjectType: Decodable>: Decodable {
    
    public let search: [ObjectType]?
    public let totalResults: String?
    
    enum CodingKeys: String, CodingKey {
        case search         = "Search"
        case totalResults
    }
    
}
