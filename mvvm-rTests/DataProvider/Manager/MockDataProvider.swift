//
//  MockDataProvider.swift
//  modacruz
//
//  Created by Mehmet Salih Aslan on 9.05.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation
@testable import ApiDataProvider

class MockDataProvider: DataProviderProtocol {
    
    func getData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>?) {
        debugPrint("mockDataUrl: \(request.mockDataUrl)")
        let bundle = Bundle(for: type(of: self))
        guard
            let path = bundle.path(forResource: request.mockDataUrl, ofType: "json")
            else {
                let error = MockDataError(message: "The json file not be found.")
                result?(.failure(error))
                return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            if let response = T.ResponseType.decode(data) {
                result?(.success(response))
            } else {
                let error = MockDataError(message: "The data could not be decoded.")
                result?(.failure(error))
            }
        } catch {
            result?(.failure(error))
        }
    }
}

class MockDataError: Error {
    
    var message: String
    
    var localizedDescription: String {
        return message
    }
    
    init( message: String) {
        self.message = message
    }

}

