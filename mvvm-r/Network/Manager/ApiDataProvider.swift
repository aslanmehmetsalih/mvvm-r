//
//  ApiDataProvider.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

struct ApiDataProvider: DataProviderProtocol {
    
    private let omdbApiKey = "bf3a219a"
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        var parameters = request.parameters
        parameters["apikey"] = omdbApiKey
        let request = AF.request(request.url,
                                 method: request.method,
                                 parameters: parameters,
                                 encoding: request.encoding,
                                 headers: nil)
        return request
    }
    
    func getData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>?) {
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
