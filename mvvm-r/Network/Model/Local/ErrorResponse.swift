//
//  ErrorResponse.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

struct ErrorResponse: Decodable {
    
    var code: String?
    var message: String?
    
    init(code: String?, message: String?) {
        self.code = code
        self.message = message
    }
    
}
