//
//  ApiRequestAdapter.swift
//  ApiDataProvider
//
//  Created by Mehmet Salih Aslan on 1.09.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

public struct ApiRequestAdapter {
        
    let method: HTTPMethod
    let parameters: Parameters
    let encoding: ParameterEncoding
    let url: String
    
    public init(method: RequestMethod, parameters: RequestParameters, encoding: RequestEncoding, url: String) {
        self.method = method.alamofireHTTPMethod
        self.parameters = parameters
        self.encoding = encoding.alamofireEncoding
        self.url = url
    }
    
}

// MARK: - Get Alamofire HTTPMethod
extension RequestMethod {
    var alamofireHTTPMethod: HTTPMethod {
        switch self {
        case .connect: return .connect
        case .delete: return .delete
        case .get: return .get
        case .head: return .head
        case .options: return .options
        case .patch: return .patch
        case .post: return .post
        case .put: return .put
        case .trace: return .trace
        }
    }
}

// MARK: - Get Alamofire ParameterEncoding
extension RequestEncoding {
    var alamofireEncoding: ParameterEncoding {
        switch self {
        case .json: return JSONEncoding.default
        case .url: return URLEncoding.default
        }
    }
}
