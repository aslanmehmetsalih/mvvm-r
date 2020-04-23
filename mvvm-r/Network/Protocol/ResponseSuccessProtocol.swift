//
//  ResponseSuccessProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

protocol ResponseSuccessProtocol: RequestProtocol {}

extension ResponseSuccessProtocol {
    
    func fetch(success: RequestManager.SuccessClosure?, failure: RequestManager.ErrorClosure?) {
        RequestManager.request(self, success: success, failure: failure)
    }
    
}
