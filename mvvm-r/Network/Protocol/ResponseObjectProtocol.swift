//
//  ResponseObjectProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

protocol ResponseObjectProtocol: RequestProtocol {
    
    associatedtype ResponseObjectType: Decodable
        
}

extension ResponseObjectProtocol {
    
    func fetch(success: RequestManager.ObjectClosure<ResponseObjectType>?, failure: RequestManager.ErrorClosure?) {
        RequestManager.request(self, success: success, failure: failure)
    }
        
}
