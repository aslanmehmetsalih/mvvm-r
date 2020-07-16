//
//  RequestProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

public protocol RequestProtocol {
    
    associatedtype ResponseType: Decodable
            
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    var url: String { get }
}

extension RequestProtocol {
    public var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}

extension RequestProtocol {
    public var url: String {
        return "http://www.omdbapi.com/" + path
    }
}
