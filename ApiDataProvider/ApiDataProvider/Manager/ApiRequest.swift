//
//  ApiRequest.swift
//  ApiDataProvider
//
//  Created by Mehmet Salih Aslan on 17.09.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public typealias OMDBAPIRequest = RequestProtocol

extension OMDBAPIRequest {
    public var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

extension OMDBAPIRequest {
    public var url: String {
        return "http://www.omdbapi.com/" + path
    }
}
