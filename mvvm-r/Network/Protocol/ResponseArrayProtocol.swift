//
//  ResponseArrayProtocol.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 23.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

protocol ResponseArrayProtocol: RequestProtocol {

    associatedtype ResponseObjectType: Decodable

}

extension ResponseArrayProtocol {

    func fetch(success: RequestManager.ArrayClosure<ResponseObjectType>?, failure: RequestManager.ErrorClosure?) {
        RequestManager.request(self, success: success, failure: failure)
    }

}
