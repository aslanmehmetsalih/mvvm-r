//
//  SearchMovieRequest.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

struct SearchMovieRequest: ResponseObjectProtocol {
    
    typealias ResponseObjectType = ArrayResponse<Movie>
    
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(keyword: String, page: Int) {
        parameters = [:]
        parameters?["s"] = keyword
        parameters?["page"] = page
    }
    
}
