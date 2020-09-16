//
//  RequestProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

public protocol RequestProtocol {
    
    associatedtype ResponseType: Decodable
            
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
