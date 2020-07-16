//
//  RequestProtocol.swift
//  modacruzTests
//
//  Created by Mehmet Salih Aslan on 11.05.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

@testable import DataProvider

extension RequestProtocol {
    
    var mockDataUrl: String {
        return ""
    }
    
}


extension RequestProtocol where Self == SearchMovieRequest {
    var mockDataUrl: String {
        return "SearchMovie"
    }
}

extension RequestProtocol where Self == GetMovieDetailRequest {
    var mockDataUrl: String {
        return "GetMovieDetail"
    }
}
