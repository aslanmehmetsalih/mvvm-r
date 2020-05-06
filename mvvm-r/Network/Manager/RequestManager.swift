//
//  RequestManager.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    typealias SuccessClosure = ((BaseResponse) -> Void)
    typealias ErrorClosure = ((ErrorResponse) -> Void)
    typealias ArrayClosure<T: Decodable> = (([T]) -> Void)
    typealias ObjectClosure<T: Decodable> = ((T) -> Void)
    
    private static var apiUrl = "http://www.omdbapi.com/"
    private static let omdbApiKey = "bf3a219a"
    
    private static func createRequest(_ request: RequestProtocol) -> DataRequest {
        var parameters = request.parameters ?? Parameters()
        parameters["apikey"] = omdbApiKey
        print("Request Path: \(request.path)")
        print("Request Method: \(request.method.rawValue)")
        print("Request Parameters: \(parameters)")
        
        let request = AF.request(apiUrl + request.path,
                                 method: request.method,
                                 parameters: parameters,
                                 encoding: URLEncoding.default,
                                 headers: generateHeader())
        request.validate()
        request.responseData { (response) in
            if let value = response.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        return request
    }
    
    /// BaseResponse
    static func request(_ request: RequestProtocol, success: SuccessClosure?, failure: ErrorClosure?) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                let result = BaseResponse.decode(response.value!)!
                switch result.response {
                case .success:
                    success?(result)
                case .error:
                    failure?(ErrorResponse(code: ErrorCode.api.rawValue, message: result.error!))
                }
            case .failure:
                handleFailure(response: response, failure: failure)
            }
        }
    }
    
    /// DecodableResponse
    static func request<T: Decodable>(_ request: RequestProtocol, success: ObjectClosure<T>?, failure: ErrorClosure?) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                let result = BaseResponse.decode(response.value!)!
                switch result.response {
                case .success:
                    success?(T.decode(response.value!)!)
                case .error:
                    failure?(ErrorResponse(code: ErrorCode.api.rawValue, message: result.error!))
                }
            case .failure:
                handleFailure(response: response, failure: failure)
            }
        }
    }
    
    static func handleFailure(response: AFDataResponse<Data>, failure: ErrorClosure?) {
        if let data = response.data, let serviceError = ErrorResponse.decode(data) {
            if let json = String(data: data, encoding: .utf8) {
                print("Response JSON: \(json)")
            }
            handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, failure: failure)
        } else if let error = response.error {
            handleError(statusCode: nil, localError: error, serviceError: nil, failure: failure)
        } else {
            handleError(statusCode: nil, localError: nil, serviceError: nil, failure: failure)
        }
    }
    
    static func handleError(statusCode: Int?, localError: Error?, serviceError: ErrorResponse?, failure: ErrorClosure?) {
        if let error = serviceError {
            failure?(error)
        } else if let error = localError as? URLError, error.code == .notConnectedToInternet {
            failure?(ErrorResponse(code: ErrorCode.connection.rawValue, message: error.localizedDescription))
        } else if let error = localError {
            failure?(ErrorResponse(code: ErrorCode.local.rawValue, message: error.localizedDescription))
        } else {
            failure?(ErrorResponse(code: ErrorCode.unknown.rawValue, message: "Unknow Error"))
        }
    }
    
    static func generateHeader() -> HTTPHeaders? {
        return nil
    }
    
}
