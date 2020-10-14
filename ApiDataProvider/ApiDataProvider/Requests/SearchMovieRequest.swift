//
//  SearchMovieRequest.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public struct SearchMovieRequest: OMDBAPIRequest {
    
    public typealias ResponseType = ArrayResponse<Movie>
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(keyword: String, page: Int) {
        parameters["s"] = keyword
        parameters["page"] = page
    }
    
}
