//
//  ApiDataProvider.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

public struct ApiDataProvider: DataProviderProtocol {
    
    private let omdbApiKey: String
    
    public init(omdbApiKey: String) {
        self.omdbApiKey = omdbApiKey
    }
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = ApiRequestAdapter(method: request.method,
                                        parameters: request.parameters,
                                        encoding: request.encoding,
                                        url: request.url)
        var parameters = adapter.parameters
        parameters["apikey"] = omdbApiKey
        let request = AF.request(adapter.url,
                                 method: adapter.method,
                                 parameters: parameters,
                                 encoding: adapter.encoding,
                                 headers: nil)
        return request
    }
    
    public func getData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>?) {
        let request = createRequest(request)
        request.validate()
        request.responseData { (response) in
            if let value = response.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                result?(.failure(error))
            }
        }
    }
    
}
