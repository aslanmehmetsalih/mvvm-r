//
//  GetMovieDetailRequest.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

public class GetMovieDetailRequest: RequestProtocol {
    
    public typealias ResponseType = MovieDetail
    
    public var path: String = ""
    public var method: HTTPMethod = .get
    public var parameters: Parameters = [:]
    
    public init(id: String) {
        parameters["i"] = id
    }
    
}
