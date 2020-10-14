//
//  GetMovieDetailRequest.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public class GetMovieDetailRequest: OMDBAPIRequest {
    
    public typealias ResponseType = MovieDetail
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(id: String) {
        parameters["i"] = id
    }
    
}
