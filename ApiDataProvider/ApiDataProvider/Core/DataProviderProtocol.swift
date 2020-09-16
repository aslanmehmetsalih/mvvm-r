//
//  DataProviderProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 12.07.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
        
    func getData<T: RequestProtocol>(for request: T,
                                     result: DataProviderResult<T.ResponseType>?)
    
}
