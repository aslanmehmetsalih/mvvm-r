//
//  BaseResponse.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

struct BaseResponse: Decodable {
    
    let response: ResultType
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case response   = "Response"
        case error      = "Error"
    }
    
}
