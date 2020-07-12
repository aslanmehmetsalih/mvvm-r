//
//  DataProviderProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import Alamofire

typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

protocol DataProviderProtocol {
        
    func getData<T: RequestProtocol>(for request: T,
                                     result: DataProviderResult<T.ResponseType>?)
    
}
